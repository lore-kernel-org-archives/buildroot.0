From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 15:57:32 +0200
Subject: [Buildroot] [PATCH 3 of 5 RFC] busybox: fix typo overwritting
In-Reply-To: <6bb6b3f59fd51d762776.1403444742@localhost>
References: <patchbomb.1403444739@localhost>
 <6bb6b3f59fd51d762776.1403444742@localhost>
Message-ID: <20140622135732.GB3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-22 15:45 +0200, Thomas De Schampheleire spake thusly:
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/busybox/busybox.mk |  2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff -r 62a7dd35bfbf -r 6bb6b3f59fd5 package/busybox/busybox.mk
> --- a/package/busybox/busybox.mk	Mon Jun 16 20:18:23 2014 +0200
> +++ b/package/busybox/busybox.mk	Sun Jun 22 15:29:01 2014 +0200
> @@ -189,7 +189,7 @@
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
