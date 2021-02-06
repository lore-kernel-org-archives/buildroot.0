From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2021 14:59:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/raptor: add CPE variables
In-Reply-To: <20210206103927.1962573-1-fontaine.fabrice@gmail.com>
References: <20210206103927.1962573-1-fontaine.fabrice@gmail.com>
Message-ID: <20210206135900.GG2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-06 11:39 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:librdf:raptor_rdf_syntax_library is a valid CPE identifier for
> this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibrdf%3Araptor_rdf_syntax_library
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/raptor/raptor.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
> index d674627f90..6d21fad58e 100644
> --- a/package/raptor/raptor.mk
> +++ b/package/raptor/raptor.mk
> @@ -10,6 +10,8 @@ RAPTOR_SITE = http://download.librdf.org/source
>  RAPTOR_DEPENDENCIES = libxml2 libxslt
>  RAPTOR_LICENSE = GPL-2.0+ or LGPL-2.1+ or Apache-2.0+
>  RAPTOR_LICENSE_FILES = LICENSE.txt
> +RAPTOR_CPE_ID_VENDOR = librdf
> +RAPTOR_CPE_ID_PRODUCT = raptor_rdf_syntax_library
>  RAPTOR_INSTALL_STAGING = YES
>  
>  # Flag is added to make sure the patch is applied for the configure.ac of raptor.
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
