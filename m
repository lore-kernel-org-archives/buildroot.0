From: Alexander Dahl <post@lespocky.de>
Date: Thu, 24 Jun 2021 13:52:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: bump version to
 1.16.6
In-Reply-To: <20210624091746.7547-1-mf@go-sys.de>
References: <20210624091746.7547-1-mf@go-sys.de>
Message-ID: <20210624115234.azrltt6s2oypv6y6@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Thu, Jun 24, 2021 at 11:17:46AM +0200, Michael Fischer wrote:
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/modem-manager/modem-manager.hash | 2 +-
>  package/modem-manager/modem-manager.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index 39cdf8cc84..b840020f38 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  167e60b26fa05887f87a0b3fb54143d7845e6e4d8c2f2dd93afac059f41e7edf  ModemManager-1.16.4.tar.xz
> +sha256  2a90b6260f66d3135609d62667ada73416694d717e7fd9b73223e3703a499617  ModemManager-1.16.6.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 9377d9a9f5..7cd5be7ef1 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MODEM_MANAGER_VERSION = 1.16.4
> +MODEM_MANAGER_VERSION = 1.16.6
>  MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)

Reviewed-by: Alexander Dahl <post@lespocky.de>

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210624/26af19d0/attachment-0001.asc>
