From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 16:48:44 +0100
Subject: [Buildroot] [PATCH v1 1/3] efivar: bump to version 30
In-Reply-To: <20161127143204.116740-2-andriy.shevchenko@linux.intel.com>
References: <20161127143204.116740-1-andriy.shevchenko@linux.intel.com>
 <20161127143204.116740-2-andriy.shevchenko@linux.intel.com>
Message-ID: <20161127164844.28ce9cbc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 16:32:02 +0200, Andy Shevchenko wrote:

> +++ b/package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
> @@ -0,0 +1,28 @@
> +From 314eb67b239e60c2ed3700e2baf9cd0e590465f3 Mon Sep 17 00:00:00 2001
> +From: Peter Jones <pjones@redhat.com>
> +Date: Thu, 27 Oct 2016 09:19:18 -0400
> +Subject: [PATCH 1/2] Use -z muldefs to avoid the multiple definitions bug
> + without -flto

The subject should have contained [PATCH] and not [PATCH 1/2]. We don't
want numbers in the patches themselves, as they quickly become wrong.

Otherwise, applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
