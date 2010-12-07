From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Dec 2010 16:31:46 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <8762v5u5r5.fsf@macbook.be.48ers.dk>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<20101206202754.57658344@surf> <8762v5u5r5.fsf@macbook.be.48ers.dk>
Message-ID: <201012071631.47002.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, December 07, 2010 07:28:14 Peter Korsgaard wrote:
>  Thomas> Those two sets of packages are not identical, that's why I
>  Thomas> proposed two different options. A package that doesn't support
>  Thomas> static build should do:
>  Thomas> 	depends on !BR2_PREFER_STATIC_LIB
>  Thomas> and all packages that do not work on !MMU should do
>  Thomas> 	depends on BR2_USE_MMU
> 
> And as this will be most packages

what are you basing this on ?  this isnt my experience at all.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101207/ec477bb9/attachment.pgp>
