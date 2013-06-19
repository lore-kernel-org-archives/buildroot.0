From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jun 2013 12:06:16 +0200
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <kprv8d$6iq$1@ger.gmane.org>
References: <kphffs$v5g$1@ger.gmane.org> <51BEAB3A.8010408@mind.be>
 <kpmcpb$lbo$1@ger.gmane.org> <51C08403.4050900@mind.be>
 <kpqg93$v74$1@ger.gmane.org> <20130619082557.447efce8@skate>
 <kprol2$uk1$1@ger.gmane.org> <20130619102133.7570dcd4@skate>
 <kprv8d$6iq$1@ger.gmane.org>
Message-ID: <20130619120616.447be089@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Nielsen,

On Wed, 19 Jun 2013 19:56:34 +1000, Adam Nielsen wrote:

> $ python2 ../../../buildroot/support/scripts/graph-depends > dep.dot

This one is correct.

> Getting targets
> Getting dependencies for ['elf2flt', 'ncurses', 'zlib', 'nano', 'busybox', 
> 'linux', 'rootfs-romfs', 'rootfs-tar', 'rootfs-cpio', 'rootfs-initramfs', 
> 'rootfs-squashfs']
> Error getting dependencies ['elf2flt', 'ncurses', 'zlib', 'nano', 'busybox', 
> 'linux', 'rootfs-romfs', 'rootfs-tar', 'rootfs-cpio', 'rootfs-initramfs', 
> 'rootfs-squashfs']
> 
> So I'm not sure whether I need to do something differently?

What does the output PDF looks like?

> > Another solution is to pastebin your full .config file somewhere and
> > give us the link, we may be able to point what's triggering the target
> > binutils build.
> 
> Here's the link I posted earlier: 
> <http://www.shikadi.net/files/buildroot/2013-06-17.br.binutils_elf2flt_err.config> 
> but be aware I have made a few changes to buildroot itself (added a few new 
> config options), but none that I am aware of that would affect binutils.

Ok, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
