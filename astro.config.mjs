import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://www.raosecops.com',
  integrations: [sitemap()],
  build: { assets: '_astro' },
  markdown: { shikiConfig: { theme: 'github-dark-dimmed', wrap: false } },
});
