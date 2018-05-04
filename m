From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 May 2018 09:16:15 +0200
Subject: [Buildroot] [PATCH 1/3] libgpgme: bump to version 1.11.1
In-Reply-To: <2659cc021a076d8ed583a0bf432ffbfa75f2655b.1525410102.git.baruch@tkos.co.il>
References: <2659cc021a076d8ed583a0bf432ffbfa75f2655b.1525410102.git.baruch@tkos.co.il>
Message-ID: <20180504091615.09cd4f84@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 May 2018 08:01:40 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...1-core-Tweak-STATUS_FAILURE-handling.patch | 51 -------------------
>  package/libgpgme/libgpgme.hash                |  8 +--
>  package/libgpgme/libgpgme.mk                  |  2 +-
>  3 files changed, 5 insertions(+), 56 deletions(-)
>  delete mode 100644 package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
