From: Hartley Sweeten <HartleyS@visionengravers.com>
Date: Mon, 9 Dec 2013 18:14:08 +0000
Subject: [Buildroot] Q: using different cross compilers with the same target
Message-ID: <DC148C5AA1CEBA4E87973D432B1C2D8817E2B652@P3PWEX4MB008.ex4.secureserver.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I have a target system that has been using an older version of Buildroot
with the Sourcery G++ Lite 2009q1-203 (gcc 4.3.3) toolchain. I have not
updated Buildroot or the toolchain on this system for quite a while
because it "works".

I now need to support a touchscreen for a new app that will be used on
the target system. The widget library I am going to use needs support for
lambda closure functions so I need to use a newer gcc compiler.

Basically I want to:

1) keep my current Buildroot setup for maintaining what we currently have.
	a) uses Sourcery G++ Lite 2009q1-203 (gcc 4.3.3) toolchain
2) create a new Buildroot tree for new app development.
	a) use the Sourcery CodeBench Lite 2013.05-24 (gcc 4.7.3) toolchain
3) merge the pieces needed from (2) into the rootfs created by (1)

Is it possible to do this? If so what pieces from (2) do I actually need to merge?

Thanks,
Hartley
