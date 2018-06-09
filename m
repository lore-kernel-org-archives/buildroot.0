From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Jun 2018 19:36:32 +0200
Subject: [Buildroot] [RFC PATCH 1/8] atk: bump to version 2.25.2
In-Reply-To: <20180608225932.13127-2-joseph.kogut@gmail.com>
References: <20180608225932.13127-1-joseph.kogut@gmail.com>
 <20180608225932.13127-2-joseph.kogut@gmail.com>
Message-ID: <20180609193632.7068bc29@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch series!

On Fri,  8 Jun 2018 15:59:25 -0700, Joseph Kogut wrote:

> -ATK_VERSION_MAJOR = 2.22
> -ATK_VERSION = $(ATK_VERSION_MAJOR).0
> +ATK_VERSION_MAJOR = 2.25

I *think* in the gnome project the odd version numbers are for
development versions. I.e 2.22 is stable, 2.24 is stable, 2.25 is
development. Also, why use 2.25, if 2.28 and 2.29 are available:

  https://ftp.gnome.org/pub/gnome/sources/atk/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
