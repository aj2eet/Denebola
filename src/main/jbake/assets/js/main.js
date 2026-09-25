(function () {
  "use strict";

  /* ---------------------------------------------------------
     Mobile nav toggle
     --------------------------------------------------------- */
  var toggle = document.getElementById("nav-toggle");
  var nav = document.getElementById("primary-nav");

  if (toggle && nav) {
    toggle.addEventListener("click", function () {
      var isOpen = nav.classList.toggle("is-open");
      toggle.setAttribute("aria-expanded", isOpen ? "true" : "false");
    });

    nav.querySelectorAll("a").forEach(function (link) {
      link.addEventListener("click", function () {
        nav.classList.remove("is-open");
        toggle.setAttribute("aria-expanded", "false");
      });
    });
  }

  /* ---------------------------------------------------------
     Scroll reveal for cards / sections
     --------------------------------------------------------- */
  var revealSelectors = [
    ".card",
    ".benefits__item",
    ".solution-block__text",
    ".cta-banner__inner",
  ];
  var revealTargets = document.querySelectorAll(revealSelectors.join(","));

  if (revealTargets.length && "IntersectionObserver" in window) {
    revealTargets.forEach(function (el) {
      el.setAttribute("data-reveal", "");
    });

    var observer = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            entry.target.classList.add("is-visible");
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.12, rootMargin: "0px 0px -40px 0px" }
    );

    revealTargets.forEach(function (el) {
      observer.observe(el);
    });
  } else {
    revealTargets.forEach(function (el) {
      el.classList.add("is-visible");
    });
  }

  /* ---------------------------------------------------------
     Cookie consent + gated Google Analytics load
     --------------------------------------------------------- */
  var CONSENT_KEY = "denebola-analytics-consent";

  function loadAnalytics() {
    var gaId = window.DENEBOLA_GA_ID;
    if (!gaId || gaId.indexOf("XXXX") !== -1) return; // not configured yet

    var script = document.createElement("script");
    script.async = true;
    script.src = "https://www.googletagmanager.com/gtag/js?id=" + gaId;
    document.head.appendChild(script);

    window.dataLayer = window.dataLayer || [];
    function gtag() {
      window.dataLayer.push(arguments);
    }
    window.gtag = gtag;
    gtag("js", new Date());
    gtag("config", gaId, { anonymize_ip: true });
  }

  function getConsent() {
    try {
      return window.localStorage.getItem(CONSENT_KEY);
    } catch (e) {
      return null;
    }
  }

  function setConsent(value) {
    try {
      window.localStorage.setItem(CONSENT_KEY, value);
    } catch (e) {
      /* storage unavailable — banner will just reappear next visit */
    }
  }

  function showCookieBanner() {
    var banner = document.createElement("div");
    banner.className = "cookie-banner";
    banner.setAttribute("role", "dialog");
    banner.setAttribute("aria-label", "Cookie consent");
    banner.innerHTML =
      '<p>We use cookies for basic site analytics. No data is shared with third parties beyond analytics.</p>' +
      '<div class="cookie-banner__actions">' +
      '<button type="button" class="btn btn--small btn--ghost" data-cookie="decline" style="color:#FAFAF7;border-color:rgba(250,250,247,0.35);">Decline</button>' +
      '<button type="button" class="btn btn--small btn--primary" data-cookie="accept">Accept</button>' +
      "</div>";
    document.body.appendChild(banner);

    banner.addEventListener("click", function (event) {
      var target = event.target.closest("[data-cookie]");
      if (!target) return;
      var choice = target.getAttribute("data-cookie");
      setConsent(choice);
      if (choice === "accept") loadAnalytics();
      banner.remove();
    });
  }

  var consent = getConsent();
  if (consent === "accept") {
    loadAnalytics();
  } else if (consent !== "decline") {
    document.addEventListener("DOMContentLoaded", showCookieBanner);
  }
})();
