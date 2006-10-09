From: Fredrik Roubert <roubert@df.lth.se>
Date: Mon, 9 Oct 2006 18:39:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <20061009151426.GA6437@aon.at>
References: <20061009114134.C2C4E485D4@busybox.net>
	<20061009142954.GL4171@igloo.df.lth.se>
	<20061009151426.GA6437@aon.at>
Message-ID: <20061009163918.GA28671@igloo.df.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon 09 Oct 17:14 CEST 2006, Bernhard Fischer wrote:

> ARCH is always set, see package/Makefile.in

Oh, I didn't know that.

> Whatis ARCH for you without your patch?

Without my patch, ARCH is set to "i386" (instead of "powerpc") when the
kernel Makefile is executed.

Cheers // Fredrik Roubert

-- 
Visserij 192  |  +32 473 344527 / +46 708 776974
BE-9000 Gent  |  http://www.df.lth.se/~roubert/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 303 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061009/a3f78859/attachment.pgp 
