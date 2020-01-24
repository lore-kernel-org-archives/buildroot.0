From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jan 2020 18:11:03 +0100
Subject: [Buildroot] [PATCH 2/6] package/perl-mojolicious: bump to version
 8.32
In-Reply-To: <20200124171107.26086-1-francois.perrad@gadz.org>
References: <20200124171107.26086-1-francois.perrad@gadz.org>
Message-ID: <20200124171107.26086-2-francois.perrad@gadz.org>
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
index d06d96be4..f409e484d 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    ebe93bb127ff954a1fa1b7b3b673081a Mojolicious-8.25.tar.gz
-sha256 366c9f65b126d71a65eb34512fe47a0d18e1cf21dbb07f6d19a4a7c7dfdd257b Mojolicious-8.25.tar.gz
+md5    c714aae5e1c3914efc0352531718c473 Mojolicious-8.32.tar.gz
+sha256 503450e76b5d114c79a01b76a3c661c8138c5729062582a88e307a4d46f9de85 Mojolicious-8.32.tar.gz
 
 # computed by scancpan
 sha256 19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 74fad1a7d..62281d7de 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 8.25
+PERL_MOJOLICIOUS_VERSION = 8.32
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.20.1
