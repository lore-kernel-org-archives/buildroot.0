From: Charles Martel <SingerIsland@gmx.com>
Date: Mon, 08 Nov 2010 11:28:54 -0500
Subject: [Buildroot] What is procedure for building custom Linux-2.6.36 from
	BuildRoot?
Message-ID: <20101108163354.35840@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I noticed that BuildRoot will build a linux-2.6.36 kernel using default values. What is the procedure for building a custom build of the Linux kernel?
Specifically, BuildRoot builds SPI Drivers as modules (.ko) by default. I'd like to have the SPI Drivers built-in (Y instead of M) and also have the UserSpace SPIDEV built.
Can this be done from BuildRoot or must I rebuild the Linux kernel after building the BuildRoot filesystem?

Also, I had to modify the Makefile to not wipe out the Linux .config file when I execute "make clean". Is there a better way to store the customized values in Linux .config as part of the BuildRoot build configuration?

Thanks.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101108/fc65055d/attachment.html>
