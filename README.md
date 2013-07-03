SQL Tutorials
==

These are largely for the benefit of @the_apatheic_w - my wife.

Huh?
--

These are small slideshows and accompanying articles written in latex which compile to pdf files with a handy little rake task.


DB Setup
--

We generate a job lot of data as per:

```bash
RUNS=50000 SQL_USER='root' SQL_PW='password'  rake populate
```

Making some PDFs
--

```bash
$ rake -T
rake compile                # Do all of the compilations
rake compile:notes          # Do the notes
rake compile:presentations  # Do the presentations
rake populate               # Populate DB
```

The rest should be simple

Licence
--

Unlicensed; you can use this or not use this. You can either give me credit or not but you must not take credit yourself. No warranty is made, mainly because the project does bugger all.
