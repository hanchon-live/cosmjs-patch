# Cosmjs patch for evmos accounts

Add ethermint account types to cosmjs.

## Usage

Clone this repo:

```sh
git clone https://github.com/hanchon-live/cosmjs-patch
```

Call the supportEvmos.sh file passing your nodejs project root folder. The script will use your `path` + `/node_modules` to find the `cosmjs` folder and apply the patch.

```sh
cd cosmjs-patch
./supportEvmos.sh /tmp/example-project
```

## Note

This will allow you to use the messages already included in the `cosmjs` lib, but it won't work for messages such as `RegisterErc20` that is Evmos specific.
