From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 29 Nov 2010 06:22:32 -0500
Subject: [Buildroot] [git commit master 1/1] target-finalize:
	libtread_db: support nonstd toolchain setups
In-Reply-To: <87y68czhxi.fsf@macbook.be.48ers.dk>
References: <20101128211439.EA7DC8D34B@busybox.osuosl.org>
	<201011281713.58894.vapier@gentoo.org>
	<87y68czhxi.fsf@macbook.be.48ers.dk>
Message-ID: <201011290622.33163.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, November 29, 2010 02:51:21 Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
>  Mike> this is incorrect.  it really has nothing to do with the
>  Mike> toolchain, nor is it non standard.  but i guess too late to fix
>  Mike> this now.  -mike
> 
> Well, toolchain in the wider sense - uClibc setup. And it is nonstandard
> in the sense that it isn't what buildroot makes / what uClibc 'make
> install_runtime' creates.

and that still is incorrect.  the blackfin toolchain uses symlinks like 
normal.  i have a patch for br that scrubs the libraries as they're installed 
into the target.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101129/d999bbdf/attachment.pgp>
