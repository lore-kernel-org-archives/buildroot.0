From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Jun 2016 22:04:33 +0200
Subject: [Buildroot] [PATCH 5/6] docs/manual/known-issues: remove
 occurrences of eglibc
In-Reply-To: <1465422059-22254-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <ee7ada2e-a706-9128-d83a-ea628a7a591e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 08/06/2016 ? 23:40, Thomas Petazzoni a ?crit :
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/known-issues.txt | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
> index 38ba941..acfe4ff 100644
> --- a/docs/manual/known-issues.txt
> +++ b/docs/manual/known-issues.txt
> @@ -14,18 +14,18 @@
>    DO_XSI_MATH, UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and
>    UCLIBC_SV4_DEPRECATED are needed if one wants to build the
>    +ltp-testsuite+ package with uClibc. You need to either use a glibc
> -  or eglibc based toolchain, or enable the appropriate options in the
> -  uClibc configuration.
> +  based toolchain, or enable the appropriate options in the uClibc
> +  configuration.
>  
>  * The +xfsprogs+ package does not build with the default uClibc
>    configuration used by the Buildroot toolchain backend. You need to
> -  either use a glibc or eglibc based toolchain, or enable the
> -  appropriate options in the uClibc configuration.
> +  either use a glibc based toolchain, or enable the appropriate
> +  options in the uClibc configuration.
>  
>  * The +mrouted+ package does not build with the default uClibc
>    configuration used by the Buildroot toolchain backend. You need to
> -  either use a glibc or eglibc based toolchain, or enable the
> -  appropriate options in the uClibc configuration.
> +  either use a glibc based toolchain, or enable the appropriate
> +  options in the uClibc configuration.
>  
>  * The +libffi+ package is not supported on the SuperH 2 and ARC
>    architectures.
> 

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain
