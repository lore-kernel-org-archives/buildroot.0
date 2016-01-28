From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2016 23:47:00 +0100
Subject: [Buildroot] [PATCH v2 3/3] docs/manual: update graph-depends
 documentation about --stop-on
In-Reply-To: <1453926735-29571-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453926735-29571-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453926735-29571-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160128224700.GH7523@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-27 21:32 +0100, Thomas Petazzoni spake thusly:
> This commit updates the graph-depends documentation to take into
> account the new 'host' keyword that can be passed to the --stop-on and
> --exclude options.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/common-usage.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index bca99f4..01cd31e 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -212,9 +212,10 @@ The +graph-depends+ behaviour can be controlled by setting options in the
>    default, +0+, means no limit.
>  
>  * +--stop-on PKG+, +-s PKG+, to stop the graph on the package +PKG+.
> -  +PKG+ can be an actual package name, a glob, or the keyword 'virtual'
> -  (to stop on virtual packages). The package is still present on the
> -  graph, but its dependencies are not.
> +  +PKG+ can be an actual package name, a glob, the keyword 'virtual'
> +  (to stop on virtual packages), or the keyword 'host' (to stop on
> +  host packages). The package is still present on the graph, but its
> +  dependencies are not.
>  
>  * +--exclude PKG+, +-x PKG+, like +--stop-on+, but also omits +PKG+ from
>    the graph.
> -- 
> 2.6.4
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
