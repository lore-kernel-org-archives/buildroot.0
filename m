From: Tiago Maluta <maluta_tiago@yahoo.com.br>
Date: Sun, 20 Apr 2008 09:47:23 -0300
Subject: [Buildroot] Question about: builroot (ARM) + pthreads + libgomp
Message-ID: <480B3B5B.7050509@yahoo.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I saw an message [1] in buildroot maillist history about an error with 
ARM, pthreads and libgomp.

I'm using buildroot-0.10.0-svn with `generic_arm` configuration:

- Target architecture variant: generic_arm
- Thread library implementation: Native POSIX Threading (NTPL)
- Target ABI: EABI
- uClibc C library version: 0.9.29
- Linux headers: 2.6.24.x
- Additional gcc options: --disable-libgomp   <---

I'm trying a new approach with (--disable-libgomp) because I got the 
same error discussed on old thread.

I'm on slackware 12
My host cc is: gcc version 4.1.2 with Thread model: posix

I'd like to know if somebody, maybe Michael Miller who started the 
thread fixed the problem.

Best regards,
Tiago Maluta

References:
[1] http://www.busybox.net/lists/buildroot/2007-June/003243.html
