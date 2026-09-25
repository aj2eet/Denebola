<#assign metaDescription = "Get in touch with Denebola to request a demo or ask about live class management, fee & school management, feedback, or data science & AI solutions." />
<#assign canonicalPath = "/contact.html" />
<#assign navActive = "contact" />
<!DOCTYPE html>
<html lang="en">
<#include "partials/head.ftl">
<body class="page-contact">
<#include "partials/nav.ftl">

  <main id="main">
    <section class="page-header">
      <div class="wrap">
        <p class="eyebrow">Contact</p>
        <h1>Request a demo</h1>
        <p class="page-header__lead">Tell us a bit about your institution and we'll get back to you shortly.</p>
      </div>
    </section>

    <section class="section">
      <div class="wrap contact-layout">
        <!--
          TODO: replace YOUR_FORM_ID with your real Formspree endpoint
          (create a free account at https://formspree.io and add this form's ID).
        -->
        <form class="contact-form" action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
          <div class="form-row">
            <label for="name">Full name</label>
            <input type="text" id="name" name="name" required autocomplete="name">
          </div>

          <div class="form-row">
            <label for="email">Work email</label>
            <input type="email" id="email" name="_replyto" required autocomplete="email">
          </div>

          <div class="form-row">
            <label for="organization">School / university name</label>
            <input type="text" id="organization" name="organization" required autocomplete="organization">
          </div>

          <div class="form-row">
            <label for="message">What are you looking for?</label>
            <textarea id="message" name="message" rows="5" required></textarea>
          </div>

          <input type="hidden" name="_subject" value="New Denebola demo request">
          <input type="text" name="_gotcha" class="hp-field" tabindex="-1" autocomplete="off" aria-hidden="true">

          <button type="submit" class="btn btn--primary btn--large">Send request</button>
        </form>

        <aside class="contact-aside">
          <h2>Prefer email?</h2>
          <p><a href="mailto:hello@denebola.com">hello@denebola.com</a></p>
          <h2>Follow along</h2>
          <p>Social links coming soon.</p>
        </aside>
      </div>
    </section>
  </main>

<#include "partials/footer.ftl">
<#include "partials/scripts.ftl">
</body>
</html>
