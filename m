From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 6 Dec 2010 15:10:44 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <20101206202754.57658344@surf>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<201012060156.53523.vapier@gentoo.org>
	<20101206202754.57658344@surf>
Message-ID: <201012061510.44903.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 06, 2010 14:27:54 Thomas Petazzoni wrote:
> I didn't mean those two things to be bound together. But it's well
> known that :
> 
>  * Some packages do not support static build
> 
>  * Some packages do not support no-MMU
> 
> Those two sets of packages are not identical, that's why I proposed two
> different options. A package that doesn't support static build should
> do:
> 
> 	depends on !BR2_PREFER_STATIC_LIB
> 
> and all packages that do not work on !MMU should do
> 
> 	depends on BR2_USE_MMU
> 
> My intention is that users can't mistakenly select packages that do not
> build statically and/or do not work on !MMU systems.

i follow now.  this makes sense to me.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101206/d379ac60/attachment.pgp>
