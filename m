From: Chris Wilkinson <kinsham@verizon.net>
Date: Mon, 15 Oct 2012 12:17:25 -0400
Subject: [Buildroot] Configuring for a custom kernel.
Message-ID: <1350317845.18861.38.camel@Homeserver>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I saved a custom kernel tarball to <BR>/dl.

I extracted the kernel with 'make linux-extract', creating
<BR>/output/build/linux-custom/.

I configured the kernel with 'make linux-menuconfig'.

This saves the kernel config in <BR>/output/build/linux-custom/.config.

What should the kernel settings be in <BR> 'make menuconfig' for

kernel version (custom tarball and its filename?)
kernel configuration ('using defconfig' or 'using custom config'?)
Defconfig name

Neither of the two kernel configuration options available seem to point
to ./config
-- 
Chris
