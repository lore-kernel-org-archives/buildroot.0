From: Eial Czerwacki <eial@scalemp.com>
Date: Tue, 01 May 2012 09:24:28 +0300
Subject: [Buildroot] enabling libc.a generation
Message-ID: <4F9F819C.80509@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I have a little issue, while trying to compile a small file within a
buildroot generated env, I get this:
/usr/lib/gcc/i686-unknown-linux-uclibc/4.2.4/../../../../i686-unknown-linux-uclibc/bin/ld:
cannot find -lc
collect2: ld returned 1 exit status

asking google suggest I'm missing libc.a, where I can enable it?

Thanks.
