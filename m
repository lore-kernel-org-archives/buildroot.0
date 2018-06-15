From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 15 Jun 2018 21:37:54 +0200
Subject: [Buildroot] [git commit] modem-manager: update package prompt
 name
In-Reply-To: <20180615193133.77D7188705@busybox.osuosl.org>
References: <20180615193133.77D7188705@busybox.osuosl.org>
Message-ID: <20180615193753.GB27644@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, Thomas,

> commit: https://git.buildroot.net/buildroot/commit/?id=de46ba290d2152261e29ef5339d8ea4adbbaf132
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

> Rename the prompt string for consistency with the package directory
> name.

> Cc: Aleksander Morgado <aleksander@aleksander.es>
> Cc: Carlos Santos <casantos@datacom.com.br>
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> Acked-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/modem-manager/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index 226f82f4f6..c4c723776d 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -1,5 +1,5 @@
>  config BR2_PACKAGE_MODEM_MANAGER
> -	bool "modemmanager"
> +	bool "modem-manager"
Sorry I should have thought twice before acking this.
It's not that important, but better would be to call it ModemManager, as that's its name.
And network-manager (called now networkmanager) as NetworkManager...

Kind regards,
Petr
