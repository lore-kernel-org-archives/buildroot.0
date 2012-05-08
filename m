From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 May 2012 10:19:08 +0200
Subject: [Buildroot] [PATCH 3/5] Added the libpth package.
In-Reply-To: <1336424385-8933-3-git-send-email-stijn.souffriau@essensium.com>
References: <1336424385-8933-1-git-send-email-stijn.souffriau@essensium.com>
 <1336424385-8933-3-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <20120508101908.1bf664f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon,  7 May 2012 22:59:43 +0200,
Stijn Souffriau <stijn.souffriau@essensium.com> a ?crit :

> @@ -406,6 +406,7 @@ source "package/orc/Config.in"
>  source "package/poco/Config.in"
>  source "package/protobuf/Config.in"
>  source "package/startup-notification/Config.in"
> +source "package/libpth/Config.in"

Alphabetic sorting.

> +config BR2_PACKAGE_LIBPTH
> +	bool "libpth"
> +	select BR2_PACKAGE_PTH_ERROR

I might have missed something, but there is no package named
BR2_PACKAGE_PTH_ERROR in Buildroot, it seems, and it doesn't appear to
be in your patchset. Maybe you forgot to send it? Or, as your package
does not have a _DEPENDENCIES = pth-error, maybe it's just some
left over of some previous work?

> +++ b/package/libpth/libpth-0003-fixed-install-depedency.patch

                                                 dependency

> @@ -0,0 +1,34 @@
> +From f2079abd360d2f1c531927e8ff7aa034d51aac66 Mon Sep 17 00:00:00 2001
> +From: Stijn Souffriau <stijn.souffriau@essensium.com>
> +Date: Tue, 3 Apr 2012 13:49:38 +0200
> +Subject: [PATCH] fixed install depedency

                                  dependency

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
