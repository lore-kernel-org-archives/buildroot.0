From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 28 Oct 2019 20:25:17 +0100
Subject: [Buildroot] [PATCH 5/8] package/perl-mojolicious: bump to version
 8.25
In-Reply-To: <20191028192520.8656-1-francois.perrad@gadz.org>
References: <20191028192520.8656-1-francois.perrad@gadz.org>
Message-ID: <20191028192520.8656-5-francois.perrad@gadz.org>
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
index 65cb9ebb0..d06d96be4 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    278dca10c640deb56f0f3c06428ff543 Mojolicious-8.22.tar.gz
-sha256 86e34a50f7daeb7af43655d7b3bfe43bb09124216bfaf3016e6fd975c3f24854 Mojolicious-8.22.tar.gz
+md5    ebe93bb127ff954a1fa1b7b3b673081a Mojolicious-8.25.tar.gz
+sha256 366c9f65b126d71a65eb34512fe47a0d18e1cf21dbb07f6d19a4a7c7dfdd257b Mojolicious-8.25.tar.gz
 
 # computed by scancpan
 sha256 19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index d7614b2d4..74fad1a7d 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 8.22
+PERL_MOJOLICIOUS_VERSION = 8.25
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.20.1
