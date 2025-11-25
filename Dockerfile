FROM node:18

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm@latest && pnpm install

COPY . .

RUN pnpm build

EXPOSE 1337

CMD ["pnpm", "start"]