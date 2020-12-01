From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 23:36:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: bump to version
 1.6.8
In-Reply-To: <20201128095050.6055-1-egorenar-dev@posteo.net>
References: <20201128095050.6055-1-egorenar-dev@posteo.net>
Message-ID: <20201201233644.67e7febb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Nov 2020 10:50:50 +0100
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
> ---
>  ...001-PATCH-Define-PN_XNUM-if-missing.patch} |   0
>  ...move-duplicated-variable-definitions.patch | 104 ------------------
>  package/makedumpfile/makedumpfile.hash        |   2 +-
>  package/makedumpfile/makedumpfile.mk          |   4 +-
>  4 files changed, 3 insertions(+), 107 deletions(-)
>  rename package/makedumpfile/{0002-PATCH-Define-PN_XNUM-if-missing.patch => 0001-PATCH-Define-PN_XNUM-if-missing.patch} (100%)
>  delete mode 100644 package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
