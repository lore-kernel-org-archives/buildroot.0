From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 1 May 2019 21:28:15 +0200
Subject: [Buildroot] [gcc 9.1] build issue with uClibc-ng 1.0.31
Message-ID: <5bca5ead-5b7d-a3f6-4b32-0b0d105557a4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

I'm testing the upcoming gcc 9.1 compiler and uClibc-ng 1.0.31 doesn't build for
sparc architecture, see the build log [1]:
"invalid hard register usage between earlyclobber operand and input operand"

This error message come from a new commit introduced in gcc by the commit [2].

I'm not sure if this is a gcc regression or a uClibc-ng issue ?

Thoughts ?

Best regards,
Romain

[1] https://gitlab.com/kubu93/toolchains-builder/-/jobs/205435757
[2]
https://github.com/gcc-mirror/gcc/commit/b782636f28f5c378897c238081d28d7a4a6ca578
