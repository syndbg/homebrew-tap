# Homebrew tap

Homebrew formulae for my projects.

## OneTUI

[OneTUI](https://github.com/syndbg/onetui) is a terminal browser for databases and message streams.

```sh
brew install --HEAD syndbg/tap/onetui
```

This builds the development version from `main` on macOS or Linux. Homebrew installs the build dependencies, including Rust. Until OneTUI's repository is public, Git access to it is required. No stable formula or prebuilt bottles are available yet.

To check for a newer development commit:

```sh
brew upgrade --fetch-HEAD syndbg/tap/onetui
```

## Maintaining formulae

Use `make check` for Ruby syntax. For OneTUI, also run:

```sh
brew audit --strict syndbg/tap/onetui
brew install --HEAD syndbg/tap/onetui
brew test --HEAD syndbg/tap/onetui
```

CI checks syntax on Ubuntu. It does not prove that a formula builds or installs.

For stable releases, update the relevant formula with the published source archive URL and verified SHA-256. Keep `head` for opt-in development builds. Each project has its own formula and release version.
