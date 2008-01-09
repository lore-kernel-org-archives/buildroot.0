From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 9 Jan 2008 19:26:16 +0100
Subject: [Buildroot] Kernel headers
References: <001e01c852d9$00a65220$7b01a8c0@Piotr>
Message-ID: <014801c852ed$4b5bbfd0$6103170a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Is it possible to use kernel headers which are already on my system?



Anything is possible in an infinite universe.
In this case, it will probably require changing the toolchain_build_<arch>/linux
link to point at your kernel headers after they have been extracted,'
or do it before the kernel headers generated and then fullfil the 
Makefile needs so they do not get overwritten

Question is: Whats the benefit of doing that

Best Regards
Ulf Samuelsson
