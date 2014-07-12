From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 00:02:14 +0200
Subject: [Buildroot] [PATCH trivial] busybox: fix typo 'overwritting'
In-Reply-To: <197abaf75c205828d953.1405192876@localhost>
References: <197abaf75c205828d953.1405192876@localhost>
Message-ID: <20140712220214.GE3582@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-07-12 21:21 +0200, Thomas De Schampheleire spake thusly:
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/busybox/busybox.mk |  2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff -r dbc59780479b -r 197abaf75c20 package/busybox/busybox.mk
> --- a/package/busybox/busybox.mk	Thu Jul 10 20:25:13 2014 +0400
> +++ b/package/busybox/busybox.mk	Sat Jul 12 21:19:46 2014 +0200
> @@ -184,7 +184,7 @@
>  endef
>  endif
>  
> -# Enable "noclobber" in install.sh, to prevent BusyBox from overwritting any
> +# Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
>  # full-blown versions of apps installed by other packages with sym/hard links.
>  define BUSYBOX_NOCLOBBER_INSTALL
>  	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
