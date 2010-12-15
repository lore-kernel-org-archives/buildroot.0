From: Sergey Naumov <sknaumov@gmail.com>
Date: Wed, 15 Dec 2010 18:39:31 +0300
Subject: [Buildroot] g++-target compilation error
Message-ID: <AANLkTintm7dU1s=1HiGeMQob30kHY6yj+x7=y8EMTDM2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

While compiling toolchain with "keep development files" on,
compilation terminated for gcc-4.4.5-target while compiling
i586-unknown-linux-uclibc/bits/sdtr1c++.h.gch/O2g.gch
with errors gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:49
error: `::fenv_t` has not been declared and a few similar errors. Then
I run make again to get the errors into a file, but compilation
proceeds normally.

Is it buildroot bug or some gcc libstdc++ unavoidable "feature"? Once
I have tried to make a toolchain from scratch with gcc-4.5.1 and
eglibc and encountered similar error: compilation terminated at
libstdc++ stage, but executing make once more helped.

Sergey Naumov.
