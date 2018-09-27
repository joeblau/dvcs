# DVCS
dvcs monorepo


## Commands

Development

```sh
# clean
swift package clean

# generate project
swift package generate-xcodeproj

# open
open open DVCS.xcodeproj
```

Development

```sh
swift build
.build/debug/GitignoreAPI serve
```

Production

```sh
swift build --configuration release
.build/release/Hello serve --env=production
```
