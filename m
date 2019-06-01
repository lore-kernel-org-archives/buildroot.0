From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 09:22:03 +0200
Subject: [Buildroot] [PATCH for-next 1/3] package/zziplib: new package
In-Reply-To: <20190529151655.7098-1-romain.naour@gmail.com>
References: <20190529151655.7098-1-romain.naour@gmail.com>
Message-ID: <20190601092203.0c32b7f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 May 2019 17:16:53 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> +ZZIPLIB_VERSION = v0.13.69
> +ZZIPLIB_SITE = $(call github,gdraheim,zziplib,$(ZZIPLIB_VERSION))
> +ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
> +ZZIPLIB_LICENSE_FILES = COPYING.LIB

I have added docs/COPYING.MPL and docs/copying.htm to the license
files, and therefore also used docs/COPYING.LIB for consistency.

Applied to next with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
