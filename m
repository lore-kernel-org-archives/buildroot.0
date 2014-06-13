From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jun 2014 19:17:04 +0200
Subject: [Buildroot] [PATCH 1/2] manual: add prerequisites for graph
	generation
In-Reply-To: <1402679208-8304-1-git-send-email-fabio.porcedda@gmail.com>
References: <1402679208-8304-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140613171704.GE3496@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-06-13 19:06 +0200, Fabio Porcedda spake thusly:
> Add "graphviz" and "python-matplotlib" as prerequisites for graph
> generation.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Reported-by: Dallas Clement <dallas.a.clement@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  docs/manual/prerequisite.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
> index c5d5442..ffe86dd 100644
> --- a/docs/manual/prerequisite.txt
> +++ b/docs/manual/prerequisite.txt
> @@ -77,3 +77,7 @@ development context (further details: refer to xref:download-infra[]).
>  ** +w3m+
>  ** +python+ with the +argparse+ module (automatically present in 2.7+ and 3.2+)
>  ** +dblatex+ (required for the pdf manual only)
> +
> +* Graph generation tools:
> +** +graphviz+

graphviz is only for the graph-depends.

Regards,
Yann E. MORIN.

> +** +python-matplotlib+ to use 'graph-build'
> -- 
> 2.0.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
