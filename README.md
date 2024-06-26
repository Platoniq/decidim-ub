# decidim_ub

[![[CI] Lint](https://github.com/Platoniq/decidim-ub/actions/workflows/lint.yml/badge.svg)](https://github.com/Platoniq/decidim-ub/actions/workflows/lint.yml)
[![[CI] Test](https://github.com/Platoniq/decidim-ub/actions/workflows/test.yml/badge.svg)](https://github.com/Platoniq/decidim-ub/actions/workflows/test.yml)

Free Open-Source participatory democracy, citizen participation and open government for cities and organizations

This is the open-source repository for decidim_ub, based on [Decidim](https://github.com/decidim/decidim).

## Setting up the application

You will need to do some steps before having the app working properly once you have deployed it:

1. Create a System Admin user: `bin/rails decidim_system:create_admin`
1. Visit `<your app url>/system` and login with your system admin credentials
1. Create a new organization. Check the locales you want to use for that organization, and select a default locale.
1. Set the correct default host for the organization, otherwise the app will not work properly. Note that you need to include any subdomain you might be using.
1. Fill the rest of the form and submit it.

You are good to go!
