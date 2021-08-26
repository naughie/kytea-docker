# Tags

- `latest` -- uses `debian:latest`.
- `buster-latest` -- the latest of kytea on `debian:buster`.


# Usages

```
$ docker run --rm -a stdin -a stdout -a stderr -i kytea:latest <foo.raw >foo.full
```

See [http://www.phontron.com/kytea/](http://www.phontron.com/kytea/) for more information.


# Multistage build

```
/usr/local/
    lib/libkytea.*
    bin/kytea
    share/kytea/model.bin
```

If you want the multistage-build, copy above files and set the environment variable `LD_LIBRARY_PATH=/usr/local/lib`.
Then you can execute `/usr/local/bin/kytea` and `/usr/local/bin/train-kytea`.
