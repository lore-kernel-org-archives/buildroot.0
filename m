From: Arun Reddy <reddyac@gmail.com>
Date: Tue, 6 May 2008 17:57:45 -0700
Subject: [Buildroot] Anyone know why Buildroot complains about uClibc RPC
	for NFS support?
Message-ID: <326f33790805061757l56e09784x5021e51f919479b5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After successfully building a FS image using an Atmel default configuration
I am now doing a build from scratch for an ARM Ltd. Integrator (ARM926EJ-S).

I go ahead and set my kernel's makefile ARCH variable to arm, then configure
my kernel to support ARM926T. For the filesystem I disabled NFS and simply
have ext2.

After configuring busybox and buildroot, I build and after a while I get the
error:

#error "*You* *need to build uClibc with UCLIBC_HAS_RPC* for NFS support."

http://img254.imageshack.us/img254/8638/rpcproblemka7.jpg

I am not understanding this error, because I never wanted support for NFS in
the first place. (I just want to build something that will run in QEMU).
Does anyone know why I get this error and why it complains about NFS support
even though I disabled it in the kernel?

Thank you for your help!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080506/a2481cc4/attachment.htm 
