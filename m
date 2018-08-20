From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:19 -0700
Subject: [Buildroot] [PATCH 18/18] perl-soap-wsdl: add dependancy on
 perl-termreadkey
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820115519.24046-19-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/perl-soap-wsdl/perl-soap-wsdl.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/perl-soap-wsdl/perl-soap-wsdl.mk b/package/perl-soap-wsdl/perl-soap-wsdl.mk
index 2eb0e0465a..b31525392f 100644
--- a/package/perl-soap-wsdl/perl-soap-wsdl.mk
+++ b/package/perl-soap-wsdl/perl-soap-wsdl.mk
@@ -7,9 +7,7 @@
 PERL_SOAP_WSDL_VERSION = 3.003
 PERL_SOAP_WSDL_SOURCE = SOAP-WSDL-$(PERL_SOAP_WSDL_VERSION).tar.gz
 PERL_SOAP_WSDL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SW/SWALTERS
-PERL_SOAP_WSDL_DEPENDENCIES = perl-class-load perl-class-std-fast perl-template-toolkit perl-timedate perl-uri perl-xml-parser perl-libwww-perl
-# perl-termreadkey needs license clarifications before adding to buildroot
-# PERL_SOAP_WSDL_DEPENDENCIES += perl-termreadkey
+PERL_SOAP_WSDL_DEPENDENCIES = perl-class-load perl-class-std-fast perl-template-toolkit perl-termreadkey perl-timedate perl-uri perl-xml-parser perl-libwww-perl
 PERL_SOAP_WSDL_LICENSE = Artistic or GPL-1.0+
 PERL_SOAP_WSDL_LICENSE_FILES = LICENSE
 
-- 
2.14.4
