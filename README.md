# Rao secops website

Dark, minimal portfolio and blog built with [Astro](https://astro.build) and hosted free on GitHub Pages at https://raosecops.com.

## First-time setup

```bash
npm install        # also creates package-lock.json, which you must commit
npm run dev        # preview at http://localhost:4321
```

## Edit your details

All personal details (email, links, tagline) live in `src/config.ts`. Replace the placeholder email there.

## Write a blog post

Add a Markdown file to `src/content/blog/`, for example `my-post.md`:

```md
---
title: "My post title"
description: "One-line summary."
date: 2026-11-01
tags: ["web", "pentesting"]
---

Your content here. Code blocks are highlighted automatically.
```

Set `draft: true` in the front matter to hide a post until it is ready.

## Deploy

1. Create a GitHub repo named `Raosecops.github.io` and push this project to the `main` branch.
2. Repo **Settings > Pages**: set **Source** to **GitHub Actions**.
3. In **Settings > Pages**, enter `raosecops.com` as the custom domain.
4. At your domain registrar, add DNS records:
   - Four **A** records for `@`: `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - One **CNAME** record for `www` pointing to `raosecops.github.io`
5. When DNS has propagated, tick **Enforce HTTPS** in Pages settings.

Every push to `main` rebuilds and publishes the site.
