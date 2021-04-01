From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 01 Apr 2021 19:14:30 +0200
Subject: [Buildroot] [PATCH/RFC 1/1] package/clamav: disable on riscv64
References: <20201114165100.2220981-1-bernd.kuhls@t-online.de>
 <20210117154811.79532aac@windsurf.home>
Message-ID: <mkbhjhx0fs.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 17 Jan 2021 15:48:11 +0100 schrieb Thomas Petazzoni:

> The problem is that uClibc-ng only implements renameat() in terms of the
> renameat() system call, and not using the renameat2() system call.

Hi Thomas,

fixed by uclibc-1.0.38.

Regards, Bernd
