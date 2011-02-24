From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 24 Feb 2011 15:56:08 +0100
Subject: [Buildroot] Unable to login to buildroot
In-Reply-To: <87pqqhr6mt.fsf@macbook.be.48ers.dk>
References: <201102241048.48537.dargaud@lpsc.in2p3.fr>
	<87pqqhr6mt.fsf@macbook.be.48ers.dk>
Message-ID: <201102241556.09029.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The default skeleton doesn't have a password set for root, and dropbear
> doesn't allow root login without a password.

I set it up in /etc/shadow. I get an error message if I try with the wrong 
pwd. And also tried without one in /etc/shadow.

> Not as far as I can see. You are creating your nfsroot from rootfs.tar
> and extracting as root, right?

Yes, with tar xvf. Any option I forgot ?

> On a system without a hardware FPU you CAN run hard float binaries if
> you have configured the kernel to emulate those instructions, but it
> will be very slow. Soft float is preferred.

Thanks. I was confused by the float options in both the kernel and uclibc.
-- 
Guillaume Dargaud
http://www.gdargaud.net/
