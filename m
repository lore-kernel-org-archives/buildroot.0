From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 11:33:11 +0100
Subject: [Buildroot] [PATCH 1/5] package/jszip: new package
In-Reply-To: <20201208180529.9152-1-patrickdepinguin@gmail.com>
References: <20201208180529.9152-1-patrickdepinguin@gmail.com>
Message-ID: <20210102113311.154be535@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Dec 2020 19:05:24 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Joeri Barbarien <joeri.barbarien@nokia.com>
> 
> Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Thanks, I've applied, with two changes.

> +JSZIP_VERSION = v3.2.2
> +JSZIP_SITE = $(call github,Stuk,jszip,$(JSZIP_VERSION))

Changed to:

+JSZIP_VERSION = 3.2.2
+JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))

Indeed, we don't want the "v" in the version field, in order for
versions to match properly with what's on release-monitoring.org.

> +JSZIP_LICENSE = MIT

License is MIT or GPL-3.0

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
