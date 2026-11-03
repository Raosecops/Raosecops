import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const blog = defineCollection({
  loader: glob({ pattern: '**/[^_]*.md', base: "./src/content/blog" }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    date: z.coerce.date().optional(),
    pubDate: z.coerce.date().optional(),
    author: z.string().optional(),
    draft: z.boolean().optional(),
  }).transform((data) => ({
    ...data,
    // Normalize pubDate or date into a reliable date property
    date: data.date || data.pubDate || new Date(),
  })),
});

export const collections = { blog };
