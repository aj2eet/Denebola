  <header class="site-header">
    <div class="wrap site-header__inner">
      <a href="/" class="brand" aria-label="Denebola home">
        <img src="/img/logo.svg" alt="" class="brand__mark" width="28" height="28">
        <span class="brand__word">Denebola</span>
      </a>

      <button class="nav-toggle" id="nav-toggle" aria-expanded="false" aria-controls="primary-nav">
        <span class="nav-toggle__bar"></span>
        <span class="nav-toggle__bar"></span>
        <span class="nav-toggle__bar"></span>
        <span class="sr-only">Menu</span>
      </button>

      <nav id="primary-nav" class="site-nav" aria-label="Primary">
        <a href="/" class="site-nav__link${((navActive!"") == "home")?then(' is-active','')}">Home</a>
        <a href="/solutions.html" class="site-nav__link${((navActive!"") == "solutions")?then(' is-active','')}">Solutions</a>
        <a href="/about.html" class="site-nav__link${((navActive!"") == "about")?then(' is-active','')}">About</a>
        <a href="/contact.html" class="site-nav__link${((navActive!"") == "contact")?then(' is-active','')}">Contact</a>
        <a href="/contact.html" class="btn btn--small btn--primary site-nav__cta">Request a Demo</a>
      </nav>
    </div>
  </header>
