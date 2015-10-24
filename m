From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Oct 2015 18:26:56 +0200
Subject: [Buildroot] [PATCH 09/11] perl-net-ssleay: bump to version 1.72
In-Reply-To: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
References: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1445704018-9780-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssleay/perl-net-ssleay.hash | 4 ++--
 package/perl-net-ssleay/perl-net-ssleay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index ca659c7..556aea7 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    511cc451a64b0c5051bd9167f37051a0 Net-SSLeay-1.70.tar.gz
-sha256 05eaaa29b8f67778040eee53150ba702fc0ce49420ddd0f1ca68d082f4ee9f4a Net-SSLeay-1.70.tar.gz
+md5    a740d7792dbac8ca8c4eb38d3b8fbd01 Net-SSLeay-1.72.tar.gz
+sha256 1baac39f0f12cee515d8bec633175bb5916ca542e5356e26420437bd6195d2f4 Net-SSLeay-1.72.tar.gz
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index c400875..03a039e 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.70
+PERL_NET_SSLEAY_VERSION = 1.72
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
-- 
2.5.0
