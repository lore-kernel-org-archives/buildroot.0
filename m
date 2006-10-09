From: Fredrik Roubert <roubert@df.lth.se>
Date: Mon, 9 Oct 2006 16:32:55 +0200
Subject: [Buildroot] PowerPC kernel headers
In-Reply-To: <20061009114445.GA4637@aon.at>
References: <20061009082642.GA20352@igloo.df.lth.se>
	<20061009114445.GA4637@aon.at>
Message-ID: <20061009143255.GM4171@igloo.df.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon 09 Oct 13:44 CEST 2006, Bernhard Fischer wrote:

> > The attached patch updates kernel-headers.mk to use asm-powerpc when
> > building with the 2.6.18 kernel headers.
>
> I just checked in r16345 that uses headers_install for the full kernel.
> This should make your patch unnecessary, i'd say. Please confirm.

That's correct. With patch r16345 my patch to kernel-headers.mk is not
needed anymore. (There is however a bug in r16345 that must be fixed
first, see separate post.)

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
Url : http://busybox.net/lists/buildroot/attachments/20061009/cf1e208a/attachment.pgp 
