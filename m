From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 16 Dec 2010 17:21:59 -0500
Subject: [Buildroot] [PATCH 47/55] linux: support a space-separated list
	of patches
In-Reply-To: <878vzph06d.fsf@macbook.be.48ers.dk>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<1baf7aad49e6e48e95506af55611e18d70e4209d.1291582352.git.thomas.petazzoni@free-electrons.com>
	<878vzph06d.fsf@macbook.be.48ers.dk>
Message-ID: <201012161722.00016.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, December 16, 2010 16:34:18 Peter Korsgaard wrote:
> case "$$p" in
>      http://*|http://*)

guessing you meant ftp://|http://

also, this patch reminds me of common problem in buildroot.  why do people use 
`dirname` and `basename` ?  these really should be letting the shell do it 
like ${f##*/} and ${f%/*}.  or use make's builtins.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101216/8b988f9c/attachment.pgp>
