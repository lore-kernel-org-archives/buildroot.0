From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jul 2020 18:21:26 +0200
Subject: [Buildroot] [PATCH 08/10] package/mojolicious:bump to version 8.57
In-Reply-To: <20200724162128.2752535-1-francois.perrad@gadz.org>
References: <20200724162128.2752535-1-francois.perrad@gadz.org>
Message-ID: <20200724162128.2752535-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 1f837cbd5..8802ba261 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  9502ffca0dac9cb85caac9a1913108d5  Mojolicious-8.40.tar.gz
-sha256  185ec9ccd3012c391db863635b7c1dd06927e7b4f2d436a45b64154fd56578c3  Mojolicious-8.40.tar.gz
+md5  c5110e47f83a7fb0d6369ea12458652f  Mojolicious-8.57.tar.gz
+sha256  baa310e3859fe83df421acb467cc07694dcc58d06d936d06584b4679a8d5bada  Mojolicious-8.57.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 140c089ab..edcbaf3d5 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 8.40
+PERL_MOJOLICIOUS_VERSION = 8.57
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.25.1
