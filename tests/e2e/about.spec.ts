import { test, expect } from '@playwright/test';

test.describe('About Collection', () => {
  test('should load the about page', async ({ page }) => {
    await page.goto('http://localhost:1337/about');
    await expect(page).toHaveTitle(/About/);
  });

  test('should display about content', async ({ page }) => {
    await page.goto('http://localhost:1337/about');
    const content = await page.locator('text=About Us');
    await expect(content).toBeVisible();
  });
});