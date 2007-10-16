From: Elizabeth Oldham <beth@the-hug.org>
Date: Tue, 16 Oct 2007 17:52:42 +0100 (BST)
Subject: [Buildroot] How to build gcc with -m24k option
In-Reply-To: <193825.36276.qm@web7902.mail.in.yahoo.com>
References: <193825.36276.qm@web7902.mail.in.yahoo.com>
Message-ID: <26795.192.168.2.100.1192553562.squirrel@home.the-hug.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>     I am trying to build cross toolchain for MIPS24K.
>   I would like to know the suggested GCC ,binutils and uclibc versions to
> be used to get -mdsp and -m24k flag options.
>
>   I used GCC-4.2.1,binutils-2.15 and uClibc-0.9.27 but i couldn't succeed.
>   Could you please help me.

You probably want bintuils-2.17, -m24k may have been taken out as it's
been marked deprecated. The equivilent is -march=mips32r2 and -mtune=24k.

Beth
