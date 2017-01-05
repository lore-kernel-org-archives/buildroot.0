From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Jan 2017 22:25:21 +0100
Subject: [Buildroot] [PATCH 1/1] docs: Add bc to required tools.
In-Reply-To: <20170105192709.29145-1-m.hoffmann@cartelsol.com>
References: <20170105192709.29145-1-m.hoffmann@cartelsol.com>
Message-ID: <20170105212521.GB3939@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus, All,

On 2017-01-05 20:27 +0100, Marcus Hoffmann spake thusly:
> We check for bc under required packages. It should be listed as such in the docs.
> 
> Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/prerequisite.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
> index ac0ab62..110fab4 100644
> --- a/docs/manual/prerequisite.txt
> +++ b/docs/manual/prerequisite.txt
> @@ -36,6 +36,7 @@ between distributions).
>  ** +unzip+
>  ** +rsync+
>  ** +file+ (must be in +/usr/bin/file+)
> +** +bc+
>  
>  * Source fetching tools:
>  ** +wget+
> -- 
> 2.9.3
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
