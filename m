From: Sergey Naumov <sknaumov@gmail.com>
Date: Wed, 3 Nov 2010 10:33:11 +0300
Subject: [Buildroot] precompiled toolchain
Message-ID: <AANLkTi=dQbWV3+nU41zvZ9O=m1n-S8wpevgdsNjx05Rc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

Does anybody know whether it is possible to compile toolchain with gcc
and uclibc first (so 3 passes for gcc and 2 passes for uclibc), and
then change the config file for uclibc and compile it 3-rd time? Gcc
only needs uclibc with minimal configuration or configuration have to
be the same as at the target system? It is worth if we want to conduct
some experiments with uclibc config but do not want to recompile gcc
all the time.

Sergey Naumov.
