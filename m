From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 21 Feb 2011 12:53:44 -0800
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
Message-ID: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks guys for bearing with my first two questions. I believe I can compile
u-boot, linux and various file systems such as cpio, jffs2, ubifs so now I
get to a new puzzle.

When I create a jffs2 image, I am used to giving u-boot a bootargs line that
looks somewhat like:

root=/dev/mtdblock2 rootfstype=jffs2 rw
mtdparts=nor:1162k(U-boot),1536k(kernel),-(JFFS2)

Which I believe essentially means that I have created mtdparts partitions on
the fly and that the root filesystem should boot at the offset of JFFS2 and
that the dynamic creation on the fly of the number of partitions doesnt
matter as long as the jffs2 lines up with the last incantation.

But, ... this doesnt work anymore.

Am I missing some deeper notion of kernel compile of partition definition
and if so, can someone point me in a good direction to compile a kernel that
will allow me to boot a jffs2 or ubifs image with a kernel created by
buildroot?

I realize this is starting to get a bit deeper into u-boot and kernel
notions, but a few hints to round out my understanding which is dated by
about 5 years now would be appreciated.

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110221/ac6dc0af/attachment.html>
