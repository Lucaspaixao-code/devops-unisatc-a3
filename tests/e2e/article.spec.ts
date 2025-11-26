import { test, expect } from '@playwright/test';

test.describe('Article Collection', () => {
  test('should load the articles page', async ({ page }) => {
    await page.goto('http://localhost:1337/articles');
    await expect(page).toHaveTitle(/Articles/);
  });

  test('should display a list of articles', async ({ page }) => {
    await page.goto('http://localhost:1337/articles');
    const articles = await page.locator('.article-item');
    const count = await articles.count();
    await expect(count).toBeGreaterThan(0);
  });
});