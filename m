From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 12 Sep 2012 17:03:16 +0200
Subject: [Buildroot] icu: disable renaming
Message-ID: <CAGm1_kuwSbyUnFE2zMrAn6DB_f2QOvrZyZisWhRri4Te3aJpfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thiago Macieira pointed to this issue with ICU
(https://plus.google.com/u/0/108138837678270193032/posts/8ujbfzMz9St):

"If you're packaging ICU on a Linux distribution, please add the
"--disable-renaming" option to your configure line. Upstream
recommends it.

And we users of ICU will thank you. Starting in 2013, we may be able
to depend on ICU.

Hopefully someone will figure out a similar option for Boost and
people will be able to use it."

Should we also use this option?

Yegor
