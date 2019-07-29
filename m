From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 09:26:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: bump to version 1.5.0
In-Reply-To: <20190620182036.28407-1-fontaine.fabrice@gmail.com>
References: <20190620182036.28407-1-fontaine.fabrice@gmail.com>
Message-ID: <20190729092610.1d3a2e65@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 20 Jun 2019 20:20:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove first and third patches (already in version)
> - Disable yaml which is enabled by default and has been added with
>   https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=c86da84d30e4b72cfb4fee22b62bea4257bc14bf
> - Move CFLAGS in {DTC,HOST_DTC}_MAKE_OPTS for readability
> - Add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...rds-for-older-kernel-u-boot-sources.patch} |   0
>  ...001-Kill-bogus-TYPE_BLOB-marker-type.patch | 138 ------------------
>  ...s-fix-simple-bus-compatible-matching.patch | 120 ---------------
>  package/dtc/dtc.hash                          |   6 +-
>  package/dtc/dtc.mk                            |   8 +-
>  5 files changed, 10 insertions(+), 262 deletions(-)
>  rename package/dtc/{0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch => 0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch} (100%)
>  delete mode 100644 package/dtc/0001-Kill-bogus-TYPE_BLOB-marker-type.patch
>  delete mode 100644 package/dtc/0003-checks-fix-simple-bus-compatible-matching.patch

Sorry, I am seeing this patch now, after applying a few minutes ago
another patch bumping dtc, from Joel Stanley. Sorry about that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
