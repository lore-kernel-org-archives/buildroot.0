From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 May 2014 19:06:05 +0200
Subject: [Buildroot] Statistics of build per architecture
Message-ID: <20140518190605.4ec48068@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yann asked me on IRC what the statistics of build results per
architecture looked like. So here are the results, for all builds done
between April, 1st 2014 and now:

+--------------+---------+----------+-------+------------+------------+
| arch         | success | failures | total | pctsuccess | pctfailure |
+--------------+---------+----------+-------+------------+------------+
| bfin         |      12 |      162 |   174 |     6.8966 |    93.1034 |
| avr32        |      35 |       62 |    97 |    36.0825 |    63.9175 |
| aarch64      |      34 |       35 |    69 |    49.2754 |    50.7246 |
| microblazeel |      50 |       43 |    98 |    51.0204 |    43.8776 |
| xtensa       |      52 |       29 |    83 |    62.6506 |    34.9398 |
| arc          |      52 |       24 |    76 |    68.4211 |    31.5789 |
| arm          |     767 |      355 |  1126 |    68.1172 |    31.5275 |
| sh4          |      50 |       22 |    72 |    69.4444 |    30.5556 |
| nios2        |      64 |       26 |    90 |    71.1111 |    28.8889 |
| powerpc      |     394 |      154 |   549 |    71.7668 |    28.0510 |
| sh4a         |      64 |       19 |    83 |    77.1084 |    22.8916 |
| x86_64       |     271 |       80 |   357 |    75.9104 |    22.4090 |
| mips         |      61 |       16 |    77 |    79.2208 |    20.7792 |
| mips64el     |     167 |       28 |   200 |    83.5000 |    14.0000 |
| mipsel       |      94 |       15 |   109 |    86.2385 |    13.7615 |
| i686         |     974 |      138 |  1116 |    87.2760 |    12.3656 |
| i486         |      26 |        1 |    27 |    96.2963 |     3.7037 |
+--------------+---------+----------+-------+------------+------------+

For comparison, back in February, I gave a similar table, for the
results going from January 1st to February 13rd 2014:

+------------+---------+----------+-------+------------+------------+
| arch       | success | failures | total | pctsuccess | pctfailure |
+------------+---------+----------+-------+------------+------------+
| bfin       |       4 |      199 |   203 |     1.9704 |    98.0296 |
| xtensa     |      14 |       88 |   102 |    13.7255 |    86.2745 |
| microblaze |      24 |      102 |   126 |    19.0476 |    80.9524 |
| avr32      |      27 |       81 |   108 |    25.0000 |    75.0000 |
| arc        |      34 |       67 |   101 |    33.6634 |    66.3366 |
| aarch64    |      40 |       50 |    93 |    43.0108 |    53.7634 |
| x86_64     |     217 |      249 |   471 |    46.0722 |    52.8662 |
| mipsel     |      64 |       61 |   125 |    51.2000 |    48.8000 |
| mips64el   |     121 |      114 |   239 |    50.6276 |    47.6987 |
| nios2      |      59 |       58 |   126 |    46.8254 |    46.0317 |
| arm        |     579 |      436 |  1018 |    56.8762 |    42.8291 |
| mips       |      61 |       47 |   115 |    53.0435 |    40.8696 |
| sh4        |      57 |       39 |    97 |    58.7629 |    40.2062 |
| sh4a       |      63 |       47 |   121 |    52.0661 |    38.8430 |
| powerpc    |    1108 |      523 |  1640 |    67.5610 |    31.8902 |
| i686       |     938 |      308 |  1250 |    75.0400 |    24.6400 |
+------------+---------+----------+-------+------------+------------+

Note that in both cases, we're roughly comparing 1.5 months of builds,
with 1 month being the last month of the 'development' part of the
cycle, and 0.5 month being the beginning of the 'debugging' part of the
cycle. So I would say the results are fairly comparable.

And we can notice a pretty significant improvement in the results.
There's still a lot of work to be done, but it's pretty clear that
we're making progress. We've moved to over 60% of success for most of
the architectures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
