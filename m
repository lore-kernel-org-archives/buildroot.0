From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Jun 2016 22:06:24 +0200
Subject: [Buildroot] [PATCH 6/6] rt-tests: remove occurrence of eglibc
In-Reply-To: <1465422059-22254-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <e1bc5223-9ac4-830f-8e95-5d5f1083aba1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 08/06/2016 ? 23:40, Thomas Petazzoni a ?crit :
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/rt-tests/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
> index 4c57c0f..96e0bad 100644
> --- a/package/rt-tests/Config.in
> +++ b/package/rt-tests/Config.in
> @@ -15,9 +15,9 @@ config BR2_PACKAGE_RT_TESTS
>  
>  	  Note that this package requires a toolchain built with the
>  	  NPTL implementation of the pthread API (this is always the
> -	  case with glibc/eglibc toolchains, but may not necessarily
> -	  be the case with uClibc toolchains, since the thread
> -	  implementation is configurable).
> +	  case with glibc toolchains, but may not necessarily be the
> +	  case with uClibc toolchains, since the thread implementation
> +	  is configurable).
>  
>  	  http://rt.wiki.kernel.org
>  
> 

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain
