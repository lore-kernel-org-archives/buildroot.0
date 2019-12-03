From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 3 Dec 2019 21:06:13 +0100
Subject: [Buildroot] [PATCH] package/postgresql: fix minor typo
In-Reply-To: <20191203093813.4760-1-p.debruijn@unilogic.nl>
References: <20191203093813.4760-1-p.debruijn@unilogic.nl>
Message-ID: <20191203210613.671b36ef@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 10:38:13 +0100, Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> pgsql as a tool does not exist, it's called psql
>
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/postgresql/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> index e548d3c..2f677da 100644
> --- a/package/postgresql/Config.in
> +++ b/package/postgresql/Config.in
> @@ -11,7 +11,7 @@ config BR2_PACKAGE_POSTGRESQL
>  	  database system.
>
>  	  Enable the readline package to gain readline support in
> -	  pgsql (the command line interpreter), which offers
> +	  psql (the command line interpreter), which offers
>  	  command history and edit functions.
>
>  	  Enable the zlib package to gain builtin compression for

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
