From: Sergey Naumov <sknaumov@gmail.com>
Date: Fri, 21 Jan 2011 10:46:48 +0300
Subject: [Buildroot] uclibc config changes and cross-compiler
Message-ID: <AANLkTi=e=ncL_G+F0iH5Dia+N2iBHi=x8EA9bsw6=uhO@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

Does anybody know whether changes in uclibc.conf when cross-compiler
is already built can lead to unrunnable programs?
For example, we made a toolchain with certain uclibc features. Then we
decided to add/remove some programs from our build so we need
additional/no longer need some uclibc features. Is it safe to rebuild
only uclibc in this case, or we also have to rebuild compiler?

Thanks in advance,

Sergey Naumov.
