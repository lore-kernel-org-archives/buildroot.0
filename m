From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Oct 2012 20:53:48 +0200
Subject: [Buildroot] Creating initrd
In-Reply-To: <1349976484.14474.20.camel@Homeserver>
References: <1349964303.8392.39.camel@Homeserver>
 <20121011164826.753f8312@skate>
 <1349968569.14474.10.camel@Homeserver>
 <20121011172356.6af76f39@skate>
 <1349976484.14474.20.camel@Homeserver>
Message-ID: <20121011205348.4a861421@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Wilkinson,

On Thu, 11 Oct 2012 13:28:04 -0400, Chris Wilkinson wrote:
> I had not done 'make clean' first. Having done that and rebuilt with
> the same config I now have,
> 
> -rw-r--r-- 1 chrisw chrisw 49223680 Oct 11 13:14 rootfs.cpio
> -rw-r--r-- 1 chrisw chrisw 17878125 Oct 11 13:15 rootfs.cpio.gz
> -rwxr-xr-x 1 chrisw chrisw 19337904 Oct 11 13:17 zImage
> 
> It would appear that the initramfs has been embedded within zImage.
> Still way too big. This is a puzzle since as you say I took care to
> not enable any but the most basic of packages.

Can you put online somewhere your kernel tarball and your kernel config
so that I can build your Buildroot configuration and try to reproduce
the problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
