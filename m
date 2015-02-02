From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Feb 2015 10:35:00 +0100
Subject: [Buildroot] [RFC 7/8] Makefile: point users to the per-package
 help text
In-Reply-To: <1422394913-13257-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1422394913-13257-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150202093500.GA3501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-27 22:41 +0100, Thomas Petazzoni spake thusly:
> Now that each package has its own help text, mention it in the main
> help text available from "make help".
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 1e5390b..adf3558 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -878,6 +878,7 @@ help:
>  	@echo '  manual-epub            - build manual in ePub'
>  	@echo '  graph-build            - generate graphs of the build times'
>  	@echo '  graph-depends          - generate graph of the dependency tree'
> +	@echo '  <pkg>-help		- get help about a specific package'
>  	@echo
>  	@echo 'Miscellaneous:'
>  	@echo '  source                 - download all sources needed for offline-build'
> -- 
> 2.1.0
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
