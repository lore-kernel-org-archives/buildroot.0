From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 15 Dec 2010 06:17:45 -0500
Subject: [Buildroot] [PATCH 03/14] toolchain: add support for external
	toolchain profiles and download
In-Reply-To: <bf29c83b99bbc83aa389f2960819e87b900904ab.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
	<bf29c83b99bbc83aa389f2960819e87b900904ab.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201012150617.46430.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 13, 2010 11:27:39 Thomas Petazzoni wrote:
> +TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package5383/public/arm-none-linux-gnueabi/
> +TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi/
> +TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package7851/public/arm-none-linux-gnueabi/
> +TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
> +TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/power/portal/package7703/public/powerpc-linux-gnu/
> +TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/superh/portal/package7783/public/sh-linux-gnu/

also, these URLs might be more complicated than necessary ... if you fetch
these guys, they get redirected to a much more sensible location:
	http://www.codesourcery.com/public/gnu_toolchain/<target>/<tarball>
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101215/03dbe6be/attachment.pgp>
