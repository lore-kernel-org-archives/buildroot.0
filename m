From: Carlos Santos <unixmania@gmail.com>
Date: Wed, 15 Jan 2020 09:17:21 -0300
Subject: [Buildroot] [PATCH] package/modem-manager: update to version
 1.12.4
In-Reply-To: <20200115095500.27579-1-aleksander@aleksander.es>
References: <20200115095500.27579-1-aleksander@aleksander.es>
Message-ID: <CAJ4jsaeaZXSYBGjuQo-FqBSfm+5FFrg1PYGhNfZucdVT5ntShw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 15, 2020 at 6:55 AM Aleksander Morgado
<aleksander@aleksander.es> wrote:
>
> https://lists.freedesktop.org/archives/modemmanager-devel/2020-January/007670.html
>
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> ---
>  package/modem-manager/modem-manager.hash | 2 +-
>  package/modem-manager/modem-manager.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index a3925bb4a2..ef2fe9c08f 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  4f76d2bdd0ed6780837cdde886eaf535f9770f9daa1ff92e63658d06aa5d25ea  ModemManager-1.12.2.tar.xz
> +sha256  852d61755e0c1a8d0c609b17192d742b324fdd2e513f3ed64b228befb859a95b  ModemManager-1.12.4.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 2f198a355a..3fc7337eb3 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -MODEM_MANAGER_VERSION = 1.12.2
> +MODEM_MANAGER_VERSION = 1.12.4
>  MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
> --
> 2.24.1
>

Tested-by: Carlos Santos <unixmania@gmail.com>
