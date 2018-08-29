From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 21:12:52 +0200
Subject: [Buildroot] [PATCH 1/1] libkcapi: bump to version 1.1.3
In-Reply-To: <20180827214323.17876-1-fontaine.fabrice@gmail.com>
References: <20180827214323.17876-1-fontaine.fabrice@gmail.com>
Message-ID: <20180829211252.3c1fdcdd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 27 Aug 2018 23:43:23 +0200, Fabrice Fontaine wrote:
> Remove patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-getrandom-call-in-kcapi-rng.c.patch   | 31 ----------------------
>  package/libkcapi/libkcapi.hash                     |  2 +-
>  package/libkcapi/libkcapi.mk                       |  2 +-
>  3 files changed, 2 insertions(+), 33 deletions(-)
>  delete mode 100644 package/libkcapi/0001-Fix-getrandom-call-in-kcapi-rng.c.patch

Since the number of changes were really small and only bug fixes, I
applied to master. I hope I won't regret it :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
