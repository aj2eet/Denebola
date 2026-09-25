# Denebola website

Static marketing site for Denebola, generated with [JBake](https://jbake.org)
(a Java/Maven static site generator) and deployed for free on GitHub Pages
with a custom domain and free SSL.

## Stack

- **JBake** (`org.jbake:jbake-maven-plugin:2.7.0`) — renders Freemarker
  templates + content files into static HTML. Driven from Maven.
- Hand-written CSS/JS — no framework, kept deliberately small and fast.
- **GitHub Actions** builds the site and deploys it to **GitHub Pages** on
  every push to `main`.
- **Formspree** (free tier) handles the contact form — no backend needed.
- **Google Analytics** (optional), loaded only after a visitor accepts the
  cookie-consent banner.

## Project layout

```
src/main/jbake/
  content/        one .html "stub" file per page (metadata + type only)
  templates/       Freemarker templates — this is where the real markup lives
    partials/       shared head/nav/footer/scripts includes
  assets/          CSS, JS, images, robots.txt, sitemap.xml, CNAME
                   (copied verbatim to the site root)
.github/workflows/deploy.yml   build + deploy pipeline
```

Each content file's `type=` metadata picks the template that renders it, e.g.
`content/solutions.html` has `type=solutions` and is rendered by
`templates/solutions.ftl`. The output filename mirrors the source path, so
`content/about.html` → `about.html` at the site root.

## Local development

Requires JDK 17+ and Maven.

```bash
# Generate the static site once, into target/output
mvn org.jbake:jbake-maven-plugin:2.7.0:generate

# Or run JBake's built-in dev server with live reload
mvn org.jbake:jbake-maven-plugin:2.7.0:inline
```

`mvn org.jbake:jbake-maven-plugin:2.7.0:inline` serves the site locally
(check the console output for the URL/port) and rebuilds on file changes —
use this to preview edits before pushing.

> Because every page links to assets with root-relative paths (e.g. `/css/style.css`),
> the site is only guaranteed to render correctly either (a) locally via the
> commands above, or (b) once the custom domain is live. The intermediate
> `https://<owner>.github.io/Denebola/` preview URL will have broken asset
> paths — that's expected and not a bug.

## Deployment

1. Push to `main` — the `deploy.yml` workflow builds the site with Maven/JBake
   and publishes `target/output` to GitHub Pages automatically.
2. One-time repo setup (in GitHub, *Settings → Pages*):
   - **Source**: GitHub Actions.
   - **Custom domain**: `denebola.com`.
   - Once DNS (below) has propagated, tick **Enforce HTTPS** — GitHub
     provisions a free, auto-renewing Let's Encrypt certificate.

## Connecting denebola.com (GoDaddy DNS)

In the GoDaddy DNS management page for `denebola.com`, add/edit these records:

| Type | Name | Value                     |
|------|------|---------------------------|
| A    | @    | `185.199.108.153`         |
| A    | @    | `185.199.109.153`         |
| A    | @    | `185.199.110.153`         |
| A    | @    | `185.199.111.153`         |
| CNAME| www  | `aj2eet.github.io`        |

Remove any existing GoDaddy "parked domain" A/CNAME records first so they
don't conflict. DNS changes can take anywhere from a few minutes to a few
hours to propagate. Once GitHub shows the domain as verified (repo Settings →
Pages), enable **Enforce HTTPS**.

## Before going live — things you still need to fill in

- **Contact form**: create a free account at [formspree.io](https://formspree.io),
  create a form, and replace `YOUR_FORM_ID` in
  `src/main/jbake/templates/contact.ftl` with your real form ID.
- **Analytics**: create a free GA4 property, then replace `G-XXXXXXXXXX` in
  `src/main/jbake/templates/partials/scripts.ftl` with your real Measurement ID.
  Until it's replaced, the site simply skips loading analytics.
- **Inbox**: `hello@denebola.com` is used as the contact address throughout
  the site — set up real email hosting for the domain (e.g. Google Workspace,
  or GoDaddy email) so it actually receives mail.
- **Copy**: all page content is placeholder copy describing the four
  solution areas (live class management, fee & school management, feedback &
  assessment, data science & AI). Review and replace with real company facts,
  differentiators, and any customer proof before launch.
- **Social links**: the Contact page has a placeholder "Social links coming
  soon" — add real links once you have them.

## Verifying changes

- Visual/responsive check: preview via `mvn ... :inline` at mobile and
  desktop widths.
- Run a Lighthouse audit (Chrome DevTools → Lighthouse) for performance,
  accessibility, and SEO before publishing changes.
- After deploying, confirm the GitHub Actions run is green (Actions tab) and
  that `https://denebola.com` serves the updated pages over HTTPS.
