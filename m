From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 25 Mar 2015 00:22:46 +0100
Subject: [Buildroot] [PATCH 2/5 v2] docs/manual: add _PATCH_DEPENDENCIES
In-Reply-To: <40b4fd981591b76d00643a310da2dbbce875de32.1426342904.git.yann.morin.1998@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
 <40b4fd981591b76d00643a310da2dbbce875de32.1426342904.git.yann.morin.1998@free.fr>
Message-ID: <5511F1C6.6000802@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

Le 14/03/2015 15:25, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-generic.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 6150bf7..adf4ddf 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -304,6 +304,15 @@ information is (assuming the package name is +libfoo+) :
>    a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependencies for
>    the current host package.
>  
> +* +LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies (in terms of
> +  package name) that are required for the current package to be
> +  patched. These dependencies are guaranteed to be extracted and
> +  patched before the current package is patched. In a similar way,
> +  +HOST_LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies for the
> +  current host package.
> +  This is seldom used; usually, +LIBFOO_DEPENDENCIES+ is what you
> +  really want to use.
> +
>  * +LIBFOO_PROVIDES+ lists all the virtual packages +libfoo+ is an
>    implementation of. See xref:virtual-package-tutorial[].
>  
> 
Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain
