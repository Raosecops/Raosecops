import rss from '@astrojs/rss';
import { getCollection } from 'astro:content';

export async function GET(context) {
  const posts = await getCollection('blog', (p) => !p.data.draft);
  return rss({
    title: 'Rao secops',
    description: 'Technical write-ups on Linux, cloud security and web application testing.',
    site: context.site,
    items: posts
      .sort((a, b) => b.data.date.valueOf() - a.data.date.valueOf())
      .map((p) => ({
        title: p.data.title,
        description: p.data.description,
        pubDate: p.data.date,
        link: `/blog/${p.id}/`,
      })),
  });
}
