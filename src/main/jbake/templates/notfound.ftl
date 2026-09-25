<#assign metaDescription = "Page not found." />
<#assign canonicalPath = "/404.html" />
<#assign navActive = "" />
<!DOCTYPE html>
<html lang="en">
<#include "partials/head.ftl">
<body class="page-notfound">
<#include "partials/nav.ftl">

  <main id="main">
    <section class="section notfound">
      <div class="wrap notfound__inner">
        <p class="eyebrow">404</p>
        <h1>This page has drifted out of orbit</h1>
        <p class="page-header__lead">We couldn't find the page you were looking for.</p>
        <a href="/" class="btn btn--primary btn--large">Back to home</a>
      </div>
    </section>
  </main>

<#include "partials/footer.ftl">
<#include "partials/scripts.ftl">
</body>
</html>
