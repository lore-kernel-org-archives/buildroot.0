From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 22:15:01 +0200
Subject: [Buildroot] [PATCH] lldpd: bump version to 0.9.4
In-Reply-To: <20160802162517.19853-1-vivien.didelot@savoirfairelinux.com>
References: <20160802162517.19853-1-vivien.didelot@savoirfairelinux.com>
Message-ID: <20160802221501.290472f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Aug 2016 12:25:17 -0400, Vivien Didelot wrote:

> -LLDPD_VERSION = 0.7.19
> +LLDPD_VERSION = 0.9.4
>  LLDPD_SITE = http://media.luffy.cx/files/lldpd
>  LLDPD_DEPENDENCIES = host-pkgconf libevent
>  LLDPD_LICENSE = ISC
>  LLDPD_LICENSE_FILES = README.md
> +LLDPD_AUTORECONF = YES

I've added a comment above this line to explain why we autoreconf, and
then I've applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
