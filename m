From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:56:43 +0200
Subject: [Buildroot] [PATCH 00/10] Bump skarnet packages to 2019.09
 release
In-Reply-To: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
References: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190930225643.066bf9d3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Sun, 29 Sep 2019 19:10:07 +0200
Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

> Eric Le Bihan (10):
>   package/skalibs: bump version to 2.9.0.0
>   package/execline: bump version to 2.5.2.0
>   package/s6-portable-utils: bump version to 2.2.2.0
>   package/s6-linux-utils: bump version to 2.5.1.0
>   package/s6-dns: bump version to 2.3.1.0
>   package/s6-networking: bump version to 2.3.1.0
>   package/s6: bump version to 2.9.0.0
>   package/s6-rc: bump version to 0.5.1.0
>   package/s6-linux-init: bump version to 1.0.3.0

I have applied those first 9 patches, but I had to fix each of them:
you forgot to update the hash of the COPYING file, and to explain so in
the commit log. Could you make sure to test with "make legal-info" your
next version bumps ?

>   package/mdevd: bump version to 0.1.1.0

I'll reply to this one specifically.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
