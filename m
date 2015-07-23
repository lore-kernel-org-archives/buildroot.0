From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Jul 2015 18:47:22 +0200
Subject: [Buildroot] [PATCH 07/15] perl-http-negotiate: fix dependencies
In-Reply-To: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
References: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1437670050-27014-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-negotiate/perl-http-negotiate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-http-negotiate/perl-http-negotiate.mk b/package/perl-http-negotiate/perl-http-negotiate.mk
index 569ed2b..b267785 100644
--- a/package/perl-http-negotiate/perl-http-negotiate.mk
+++ b/package/perl-http-negotiate/perl-http-negotiate.mk
@@ -7,7 +7,7 @@
 PERL_HTTP_NEGOTIATE_VERSION = 6.01
 PERL_HTTP_NEGOTIATE_SOURCE = HTTP-Negotiate-$(PERL_HTTP_NEGOTIATE_VERSION).tar.gz
 PERL_HTTP_NEGOTIATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTTP_NEGOTIATE_DEPENDENCIES = perl-http-message
+PERL_HTTP_NEGOTIATE_DEPENDENCIES = perl perl-http-message
 PERL_HTTP_NEGOTIATE_LICENSE = Artistic or GPLv1+
 PERL_HTTP_NEGOTIATE_LICENSE_FILES = README
 
-- 
2.1.4
