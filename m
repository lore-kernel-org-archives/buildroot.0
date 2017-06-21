From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 22:50:42 +0200
Subject: [Buildroot] [PATCH] libglib2: bump version to 2.52.2
In-Reply-To: <20170621204635.19915-1-aduskett@codeblue.com>
References: <20170621204635.19915-1-aduskett@codeblue.com>
Message-ID: <20170621225042.3536ecc7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Jun 2017 16:46:35 -0400, Adam Duskett wrote:
> Patches were updated to work with new version, and now pass check-package.

What was changed to have them "pass check-package" ?

> 0003-gio-2.0.pc-include-libmount-in-Libs.private.patch was added to upstream.

... as of commit
https://git.gnome.org/browse/glib/commit/?id=ecdd3c29fc4bd28f01fe53d0528bfee888c9c62c.

> diff --git a/package/libglib2/0001-fix-compile-time-atomic-detection.patch b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
> index f6d0c5d..222ba56 100644
> --- a/package/libglib2/0001-fix-compile-time-atomic-detection.patch
> +++ b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
> @@ -1,4 +1,7 @@
> -[PATCH] Fix compilation issues on architectures with limited atomic support
> +From d5c628a6179b99705fa05ab87437321b132c81bc Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@codeblue.com>

Please don't change the author. Keep Brendan Heading
<brendanheading@gmail.com> as the author.

You can do this with "git commit --author=..."


> diff --git a/package/libglib2/0002-disable-tests.patch b/package/libglib2/0002-disable-tests.patch
> index 1b0c535..fa74b5c 100644
> --- a/package/libglib2/0002-disable-tests.patch
> +++ b/package/libglib2/0002-disable-tests.patch
> @@ -1,12 +1,37 @@
> +From ee2d6609bce808ac72afdbf86db1a6e27c78171e Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@codeblue.com>

Ditto.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
