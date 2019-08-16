From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 16 Aug 2019 21:42:47 +0200
Subject: [Buildroot] [PATCH] doc/manual: fix graph-size documentation
In-Reply-To: <20190816123426.15194-1-yann.morin.1998@free.fr>
References: <20190816123426.15194-1-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVz9ZUwA_Vdn+rxDpgwKKWBvYt7ocb2cKy=JzjUNHbOjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El vie., 16 ago. 2019 a las 14:34, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  docs/manual/common-usage.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index e3d7578c85..a36301afd5 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -310,8 +310,8 @@ installed (+python-matplotlib+ on most distributions), and also the
>  +argparse+ module if you're using a Python version older than 2.7
>  (+python-argparse+ on most distributions).
>
> -Just like for the duration graph, a +BR2_GRAPH_OUT+ environment is
> -supported to adjust the output file format. See xref:graph-depends[]
> +Just like for the duration graph, a +BR2_GRAPH_OUT+ environment variable
> +is supported to adjust the output file format. See xref:graph-depends[]
>  for details about this environment variable.
>
>  .Note

Acked-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
