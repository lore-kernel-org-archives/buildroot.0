From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:14:03 +0200
Subject: [Buildroot] [PATCH 3/3] package/libspandsp: new package
In-Reply-To: <1430060451-4075-4-git-send-email-bernd.kuhls@t-online.de>
References: <1430060451-4075-1-git-send-email-bernd.kuhls@t-online.de>
 <1430060451-4075-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426191403.6be36348@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Apr 2015 17:00:51 +0200, Bernd Kuhls wrote:

> +LIBSPANDSP_VERSION = 20140809
> +LIBSPANDSP_SOURCE = spandsp-$(LIBSPANDSP_VERSION).tar.gz
> +LIBSPANDSP_SITE = http://www.soft-switch.org/downloads/spandsp/snapshots
> +LIBSPANDSP_LICENSE = LGPL-2.1

LGPLv2.1 or LGPLv2.1+. Yes, I know it doesn't match
https://spdx.org/licenses/, but it's what we've been using in Buildroot
for all other packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
