From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Sep 2010 13:31:24 +0200
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>
	<20100913102031.03481d63@surf>
	<SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>
	<87mxrm6lrc.fsf@macbook.be.48ers.dk>
	<SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>
Message-ID: <20100915133124.604f8b74@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Sep 2010 11:07:51 +0000
Johnny Beardsmore <jny0@hotmail.com> wrote:

> I don't have a rootfs.ext2 in my output/images/.  I have
> rootfs.i486.tar and rootfs.i486.tar.bz2.  After un-taring these, I
> get /usr/sbin/mkfs.ext2 and /usr/sbin/fsck.ext2.  What could I be
> doing differently? Regards, JNY

You have mistakenly unselected the generation of an ext2 image in
"Target filesystem options". The generation of an ext2 image is enabled
by default when you start a fresh configuration, so if it's not
enabled, it's because you have unselected it somehow.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
