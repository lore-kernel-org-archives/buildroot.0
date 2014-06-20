From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Jun 2014 23:21:51 +0200
Subject: [Buildroot] [PATCH 1/2] manual: add requirements for graph
	generation
In-Reply-To: <1402997634-2783-1-git-send-email-fabio.porcedda@gmail.com>
References: <1402997634-2783-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140620212151.GD26745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-06-17 11:33 +0200, Fabio Porcedda spake thusly:
> Add "graphviz" and "python-matplotlib" as requirements for graph
> generation.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Reported-by: Dallas Clement <dallas.a.clement@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> 
> Notes:
>     v2:
>      - specify that "graphviz" is needed only for graph-depends (Yann)
> 
>  docs/manual/prerequisite.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
> index c5d5442..30970d2 100644
> --- a/docs/manual/prerequisite.txt
> +++ b/docs/manual/prerequisite.txt
> @@ -77,3 +77,7 @@ development context (further details: refer to xref:download-infra[]).
>  ** +w3m+
>  ** +python+ with the +argparse+ module (automatically present in 2.7+ and 3.2+)
>  ** +dblatex+ (required for the pdf manual only)
> +
> +* Graph generation tools:
> +** +graphviz+ to use 'graph-depends' and '<pkg>-graph-depends'
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
