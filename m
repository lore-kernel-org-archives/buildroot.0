From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 11 Dec 2010 22:52:50 -0500
Subject: [Buildroot] [PATCH] zlib: fix installing when static-only
In-Reply-To: <871v5onfhx.fsf@macbook.be.48ers.dk>
References: <1291759032-1336-1-git-send-email-vapier@gentoo.org>
	<871v5onfhx.fsf@macbook.be.48ers.dk>
Message-ID: <201012112252.52313.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday, December 11, 2010 16:53:14 Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger writes:
>  Mike> The switch from manual targets to using zlib's targets to fix shared
>  Mike> building/installing doesn't work quite right as zlib itself doesn't
>  Mike> handle static-only installs fully.
> 
> Ehh, that seems very similar to the zlib-1.2.5-fix-static-install.patch
> we already have?

i dont know what you're referring to.  there are no patches currently:
	http://git.buildroot.net/buildroot/tree/package/zlib
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101211/c71c2e0e/attachment.pgp>
