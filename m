From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 1 Feb 2020 11:01:19 +0100
Subject: [Buildroot] [PATCH] support: expand the legal-info header
In-Reply-To: <20200201092324.6785-1-yann.morin.1998@free.fr>
References: <20200201092324.6785-1-yann.morin.1998@free.fr>
Message-ID: <51421873-f785-0fa2-d1e2-dc8360f5a229@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 01/02/20 10:23, Yann E. MORIN wrote:
> Make it explicit that the content of legal-info is a best-effort, and
> that the Buildroot developpers make no guarantee that it is correct.

s/developpers/developers/

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  support/legal-info/README.header | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/support/legal-info/README.header b/support/legal-info/README.header
> index 55996b5303..050b093537 100644
> --- a/support/legal-info/README.header
> +++ b/support/legal-info/README.header
> @@ -33,3 +33,7 @@ This material is composed of the following items.
>     'host-licenses/' subdirectories for target and host packages
>     respectively.
>  
> +Note that the Buildroot developers provide no guarantee as to whether the
> +information contained in the material thus collected, is correct or
> +exhaustive, or both. It is your responsibility, as part of your compliance
> +process, to verify the correctness and exhaustivity of that information.

Ok with the idea, but this paragraph with the initial paragraph (before
the bullet list), so I'd move it up there. Also it has some duplicate
content that should be removed (e.g. "It is your responsibility").

Minor comments now:

"material thus collected" sounds non-natural to me. Any native english
speaker's opinion?

Also I'd remove the comma after "collected".

-- 
Luca
