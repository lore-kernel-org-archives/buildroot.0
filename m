From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Sep 2010 10:20:31 +0200
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>
Message-ID: <20100913102031.03481d63@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Sep 2010 07:51:55 +0000
Johnny Beardsmore <jny0@hotmail.com> wrote:

> 1) e2fsck the rootfs file on the build machine.  This creates an error thus:

Yann Morin has already told you that you are trying to run e2fsck on a
tarball. A tarball is not an ext2 image, so obviously it cannot work.

What you're doing is exactly as if your trying to run an image
verification program on a text document. It doesn't work because it
makes no sense to try it in the first place.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
