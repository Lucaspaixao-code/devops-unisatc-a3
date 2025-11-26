FROM node:20-alpine

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev python3 make g++

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm@latest && pnpm install --frozen-lockfile

COPY . .

RUN cp .env.example .env

ENV NODE_ENV=production
RUN pnpm build

EXPOSE 1337

CMD ["pnpm", "start"]