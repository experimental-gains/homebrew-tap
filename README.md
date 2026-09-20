# experimental-gains/tap

Homebrew formulas for [experimental-gains](https://github.com/experimental-gains) tools.

```
brew tap experimental-gains/tap
brew install modslop
brew install goproxycheck
brew install goprivaudit
```

## Formulas

- **[modslop](https://github.com/experimental-gains/modslop)** — catch
  slopsquatted and hallucinated Go module names in `go.mod`.
- **[goproxycheck](https://github.com/experimental-gains/goproxycheck)** —
  diagnose why a Go module version isn't yet fetchable via
  `proxy.golang.org`/`sum.golang.org`.
- **[goprivaudit](https://github.com/experimental-gains/goprivaudit)** —
  audit `GOPRIVATE`/`GONOSUMDB` config against `go.mod` dependencies and
  git `insteadOf` rewrites.

All three are also installable directly with no tap, e.g.
`go install github.com/experimental-gains/modslop@latest` — this tap is
an additional, non-Go-toolchain-requiring install path for `brew` users.

MIT-licensed, source in each tool's own repo linked above.
