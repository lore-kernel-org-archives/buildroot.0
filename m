From: Martin Hicks <mort@bork.org>
Date: Tue, 13 Mar 2018 08:27:51 -0400
Subject: [Buildroot] [PATCH] cryptsetup: bump to version 2.0.2
In-Reply-To: <5b149bd17fe250b527ebed2cd0d83ccea9718561.1520943156.git.baruch@tkos.co.il>
References: <5b149bd17fe250b527ebed2cd0d83ccea9718561.1520943156.git.baruch@tkos.co.il>
Message-ID: <CAJUS3X=FXonB86kwg+DNAUoeUo1ZE=_DkTE+COV4npEjxaxffg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 13, 2018 at 8:12 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Cc: Martin Hicks <mort@bork.org>
>

I haven't played with this release yet, but I see no reason not to keep it
up to date.

Acked-by: Martin Hicks <mort@bork.org>


> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/cryptsetup/cryptsetup.hash | 2 +-
>  package/cryptsetup/cryptsetup.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/
> cryptsetup.hash
> index c54b0dc60711..7629691a6680 100644
> --- a/package/cryptsetup/cryptsetup.hash
> +++ b/package/cryptsetup/cryptsetup.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.0/
> sha256sums.asc
> -sha256 adc623b9e3e3ab5c14145b8baf21b741e513ee5bf90d2b4d85a745c2f05da199
> cryptsetup-2.0.0.tar.xz
> +sha256 4f8105d7f3bf758d58da3058b3cbd66c0ca81492b2dafe8ae7c049cc9e939e97
> cryptsetup-2.0.2.tar.xz
>  sha256 45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33
> COPYING
>  sha256 8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5
> COPYING.LGPL
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/
> cryptsetup.mk
> index 0d8480ba4886..39c9b7b0bc19 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -5,7 +5,7 @@
>  ############################################################
> ####################
>
>  CRYPTSETUP_VERSION_MAJOR = 2.0
> -CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
> +CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
>  CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>  CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(
> CRYPTSETUP_VERSION_MAJOR)
>  CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c \
> --
> 2.16.1
>
>


-- 
Martin Hicks P.Eng.      |         mort at bork.org
Bork Consulting Inc.     |   +1 (613) 266-2296
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180313/14500f99/attachment.html>
