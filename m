From: Christopher McCrory <chrismcc@gmail.com>
Date: Wed, 22 Aug 2018 10:01:43 -0700
Subject: [Buildroot] [PATCH 18/18] perl-soap-wsdl: add dependancy on
 perl-termreadkey
In-Reply-To: <20180820115519.24046-19-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-19-chrismcc@gmail.com>
Message-ID: <CALURroSfqx8CtoxwYNjj0sPtr83+CVPwqA=DfqmZ+tNQrpNRJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perl-termreadkey fails ono cross compile so this will fail also :(



On Mon, Aug 20, 2018 at 4:55 AM Christopher McCrory <chrismcc@gmail.com>
wrote:

> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/perl-soap-wsdl/perl-soap-wsdl.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/package/perl-soap-wsdl/perl-soap-wsdl.mk
> b/package/perl-soap-wsdl/perl-soap-wsdl.mk
> index 2eb0e0465a..b31525392f 100644
> --- a/package/perl-soap-wsdl/perl-soap-wsdl.mk
> +++ b/package/perl-soap-wsdl/perl-soap-wsdl.mk
> @@ -7,9 +7,7 @@
>  PERL_SOAP_WSDL_VERSION = 3.003
>  PERL_SOAP_WSDL_SOURCE = SOAP-WSDL-$(PERL_SOAP_WSDL_VERSION).tar.gz
>  PERL_SOAP_WSDL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SW/SWALTERS
> -PERL_SOAP_WSDL_DEPENDENCIES = perl-class-load perl-class-std-fast
> perl-template-toolkit perl-timedate perl-uri perl-xml-parser
> perl-libwww-perl
> -# perl-termreadkey needs license clarifications before adding to buildroot
> -# PERL_SOAP_WSDL_DEPENDENCIES += perl-termreadkey
> +PERL_SOAP_WSDL_DEPENDENCIES = perl-class-load perl-class-std-fast
> perl-template-toolkit perl-termreadkey perl-timedate perl-uri
> perl-xml-parser perl-libwww-perl
>  PERL_SOAP_WSDL_LICENSE = Artistic or GPL-1.0+
>  PERL_SOAP_WSDL_LICENSE_FILES = LICENSE
>
> --
> 2.14.4
>
>

-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180822/83cb3302/attachment.html>
