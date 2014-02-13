From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 20:37:57 +0100
Subject: [Buildroot] autobuilder architecture statistics
Message-ID: <20140213203757.1c7f7fe0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Like I did some time ago, here are some per-architecture statistics of
the build results, since January, 1st 2014:

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

So it would be good if the Blackfin people could give some serious help
here: we have had only 4 successful builds, and 199 failed builds for
this architecture since the beginning of the year.

Of course, all the other architectures also need some help.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
