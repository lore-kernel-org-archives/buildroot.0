From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 24 Feb 2014 12:38:22 +0100
Subject: [Buildroot] [PATCH 03/13] manual: document minimal kernel
	headers dependency
In-Reply-To: <1249d9593e127149e2634d7224be38baac0f8850.1393198603.git.yann.morin.1998@free.fr>
References: <cover.1393198603.git.yann.morin.1998@free.fr>
 <1249d9593e127149e2634d7224be38baac0f8850.1393198603.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LWOgVZ55U8C7XruiLoX8AetYPnPCTspF3uK6Eoxj+QkhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 24, 2014 at 12:40 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>
> ---
> Changes v1 -> v2:
>   - fix typo  (Samuel)
>   - fix asciidoc syntax  (Thomas DS)
> ---
>  docs/manual/adding-packages-directory.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 40e543c..ead3570 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -218,6 +218,12 @@ use in the comment.
>  ** Dependency symbol: +BR2_USE_MMU+
>  ** Comment string: no comment to be added
>
> +* Kernel headers
> +** Dependency symbol: +BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y+, (replace
> +   +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
> +** Comment string: +headers >= X.Y+ (replace +X.Y+ with the
> +   proper version)
> +
>  * C library
>  ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
>  +BR2_TOOLCHAIN_USES_UCLIBC+
> --

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
