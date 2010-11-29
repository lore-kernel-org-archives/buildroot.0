From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 29 Nov 2010 18:45:39 -0500
Subject: [Buildroot] [PATCH] target-finalize: fix libthread_db strip fix
In-Reply-To: <87eia3ygqg.fsf@macbook.be.48ers.dk>
References: <1290897792-22134-1-git-send-email-vapier@gentoo.org>
	<201011291544.27824.vapier@gentoo.org>
	<87eia3ygqg.fsf@macbook.be.48ers.dk>
Message-ID: <201011291845.40939.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, November 29, 2010 16:14:47 Peter Korsgaard wrote:
> Yes. There's naturally some scale differences, but we follow the general
> process:
> 
> - Releases every 3 months
> - Only the maintainer (me) has direct commit access
> - A period (2 months) after a release the tree is open for new features,
>   then -rc1 is released and only fixes are accepted.

OK, i'll adjust my merge expectations accordingly
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101129/dc45dc85/attachment-0001.pgp>
