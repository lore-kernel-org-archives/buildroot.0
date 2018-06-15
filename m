From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 15 Jun 2018 09:06:08 +0200
Subject: [Buildroot] [PATCH 2/2] modem-manager: update package prompt
 name
In-Reply-To: <0e57f8271a0c088d599b8fcbaaaaa8f1510c1688.1529035334.git.baruch@tkos.co.il>
References: <b3e5a3337202ba9221963ab01400497985202ef2.1529035334.git.baruch@tkos.co.il>
 <0e57f8271a0c088d599b8fcbaaaaa8f1510c1688.1529035334.git.baruch@tkos.co.il>
Message-ID: <CAGm1_ktP-rKa5hCCbcHGCQGqntPvM1s437CX_19VP9iXSq9tTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 15, 2018 at 6:02 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Rename the prompt string for consistency with the package directory
> name.
>
> Cc: Aleksander Morgado <aleksander@aleksander.es>
> Cc: Carlos Santos <casantos@datacom.com.br>
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/modem-manager/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index 226f82f4f631..c4c723776d06 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -1,5 +1,5 @@
>  config BR2_PACKAGE_MODEM_MANAGER
> -       bool "modemmanager"
> +       bool "modem-manager"
>         depends on BR2_USE_WCHAR # libglib2 and gnutls
>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>         depends on BR2_USE_MMU # dbus
> --
> 2.17.1
>
