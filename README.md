# docker-compose-chia

Composed [Chia Network](https://www.chia.net) blockchain and smart transaction platform environment for Docker.

## Why?

Mostly testing. Definitely fun. Possibly profit.

## Setup

### macOS

```bash
bash setup.sh --macos
```

### Linux

```bash
bash setup.sh --linux
```


## Farming

To start full node:

```bash
bash up.sh
```

### Low-level operations

Please mind having `.env` loaded into your shell.

To start full node:

```bash
docker-compose up -d full_node
```

To start farmer node:

```bash
docker-compose up -d farmer
```

To start harvester node:

```bash
docker-compose up -d harvester
```

## Development

```
bash guard.sh
```

## F.A.Q.

What should I do with it?
-> Simply: configure, run on some machine with four cores, 4GB+ RAM, 200GB+ disk space and forget for a couple of years.

## Credits

Great thanks for: https://gist.github.com/snikch/ab15159e633d21619bdf6a056bec8830

## Support

Please check: https://github.com/pr0d1r2/donate

# Copyright

Copyright (c) 2021 Marcin Nowicki. See LICENSE for further details.
