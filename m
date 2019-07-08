From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 08 Jul 2019 11:36:17 +0000
Subject: [Buildroot] [Bug 11991] [numpy] segfault when compiling for RPi3
 64bits
In-Reply-To: <bug-11991-163@https.bugs.busybox.net/>
References: <bug-11991-163@https.bugs.busybox.net/>
Message-ID: <bug-11991-163-9UoYMib0Rj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11991

--- Comment #2 from XonqNopp <xonqnoppp@gmail.com> ---
Created attachment 8136
  --> https://bugs.busybox.net/attachment.cgi?id=8136&action=edit
Config used when encountering numpy segfault

Attached my .config (compressed because too large for bugzilla).

I started from configs/raspberry3_64_defconfig and added the stuff I need.

About GCC version I am not sure which one you want... So I have these:

$
/home/buildroot/buildroot201907numpySegFault/output/host/bin/aarch64-buildroot-linux-uclibc-gcc
--version
aarch64-buildroot-linux-uclibc-gcc.br_real (Buildroot 2019.05) 7.4.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

$ gcc --version
gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
Copyright (C) 2016 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Let me know if you want to know about another one...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
