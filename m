From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 25 Mar 2009 10:59:05 +0100
Subject: [Buildroot] Stuck at installing kernel,
	rootfs and grub to	compact flash
In-Reply-To: <997570.39073.qm@web43416.mail.sp1.yahoo.com>
References: <997570.39073.qm@web43416.mail.sp1.yahoo.com>
Message-ID: <20090325095904.GA26624@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 24, 2009 at 01:38:34PM -0700, Mark Fisher wrote:
>Hi,
>
>I've recently discovered buildroot and have?used it to configure a custom 2.6.27 kernel, root file system, and have selected the grub as the bootloader. But now I'm stuck at figuring out how to install?the rootfs..i586.ext file and the grub bootloader onto a Compact Flash that I can boot a PC104 type board from. 
>
>I've searched the mailing list and google but can't seem to find a proper example of how to do this. If anyone can provide help on how to do this it would be?much appreciated. In addition to being new to buildroot I'm also somewhat new to Linux too.

plug the CF card into your build host, format the disk and mount it,
extract the tarball with the rootfs and install grub.

HTH,
