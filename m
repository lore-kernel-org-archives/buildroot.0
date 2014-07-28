From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 28 Jul 2014 18:50:19 +0200
Subject: [Buildroot] [PATCH 2/3] perl-net-ssleay: bump to version 1.65
In-Reply-To: <1406566220-13271-1-git-send-email-francois.perrad@gadz.org>
References: <1406566220-13271-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1406566220-13271-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssleay/perl-net-ssleay.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index fb9b385..de8e369 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.64
+PERL_NET_SSLEAY_VERSION = 1.65
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM/
 PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
-- 
1.9.1
