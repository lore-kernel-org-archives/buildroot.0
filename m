From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Apr 2020 16:18:35 +0200
Subject: [Buildroot] [PATCH 4/8] package/perl-mojolicious: bump to version
 8.40
In-Reply-To: <20200424141839.1594-1-francois.perrad@gadz.org>
References: <20200424141839.1594-1-francois.perrad@gadz.org>
Message-ID: <20200424141839.1594-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious/perl-mojolicious.hash | 6 +++---
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index f409e484d..1f837cbd5 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    c714aae5e1c3914efc0352531718c473 Mojolicious-8.32.tar.gz
-sha256 503450e76b5d114c79a01b76a3c661c8138c5729062582a88e307a4d46f9de85 Mojolicious-8.32.tar.gz
+md5  9502ffca0dac9cb85caac9a1913108d5  Mojolicious-8.40.tar.gz
+sha256  185ec9ccd3012c391db863635b7c1dd06927e7b4f2d436a45b64154fd56578c3  Mojolicious-8.40.tar.gz
 
 # computed by scancpan
-sha256 19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a LICENSE
+sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 62281d7de..140c089ab 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 8.32
+PERL_MOJOLICIOUS_VERSION = 8.40
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.20.1
