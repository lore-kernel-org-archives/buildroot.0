From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 21:39:28 +0200
Subject: [Buildroot] [PATCH 1/1] support/kconfig: Fix typo in
 README.buildroot.
In-Reply-To: <1381775071-14556-1-git-send-email-ps.report@gmx.net>
References: <1381775071-14556-1-git-send-email-ps.report@gmx.net>
Message-ID: <20131014193928.GC3491@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-10-14 20:24 +0200, Peter Seiderer spake thusly:
> Fix typo in README.buildroot (s/config/kconfig/).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  support/kconfig/README.buildroot | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.buildroot
> index d3d8613..0e16e81 100644
> --- a/support/kconfig/README.buildroot
> +++ b/support/kconfig/README.buildroot
> @@ -3,12 +3,12 @@ to suit Buildroot.
>  
>  To update:
>  	cp -r /usr/src/linux/scripts/kconfig support/kconfig.new
> -	cd support/config.new
> +	cd support/kconfig.new
>  	cp -a ../kconfig/patches ../kconfig/README.buildroot .
>  	quilt push -a
>  	# Fix any conflict
>  	cd ..
> -	rm -rf config
> +	rm -rf kconfig
>  	mv kconfig.new kconfig
>  
>  Then verify the toplevel targets work:
> -- 
> 1.8.1.4
> 
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
