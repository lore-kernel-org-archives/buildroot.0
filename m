From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 12:19:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-xml-libxml: add CPE
 variables
In-Reply-To: <20210403153801.2222070-1-fontaine.fabrice@gmail.com>
References: <20210403153801.2222070-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404101901.GF2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-03 17:38 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:xml-libxml_project:xml-libxml is a valid CPE identifier for
> this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axml-libxml_project%3Axml-libxml
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/perl-xml-libxml/perl-xml-libxml.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
> index 23d3e988fa..9b563e29b5 100644
> --- a/package/perl-xml-libxml/perl-xml-libxml.mk
> +++ b/package/perl-xml-libxml/perl-xml-libxml.mk
> @@ -10,6 +10,8 @@ PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
>  PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2
>  PERL_XML_LIBXML_LICENSE = Artistic or GPL-1.0+
>  PERL_XML_LIBXML_LICENSE_FILES = LICENSE
> +PERL_XML_LIBXML_CPE_ID_VENDOR = xml-libxml_project
> +PERL_XML_LIBXML_CPE_ID_PRODUCT = xml-libxml
>  PERL_XML_LIBXML_DISTNAME = XML-LibXML
>  
>  PERL_XML_LIBXML_CONF_OPTS = \
> -- 
> 2.30.2
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
