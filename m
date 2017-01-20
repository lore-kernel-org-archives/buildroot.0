From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 20 Jan 2017 10:29:57 +0100
Subject: [Buildroot] [PATCH 04/12] perl-mojolicious: bump to version 7.20
In-Reply-To: <1484904605-11239-1-git-send-email-francois.perrad@gadz.org>
References: <1484904605-11239-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1484904605-11239-4-git-send-email-francois.perrad@gadz.org>
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
index 23a30e5..21b2768 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    91799c9c21e116dc438fdec1ede5a977 Mojolicious-7.0.tar.gz
-sha256 2da57d411aaf718d6b93deebd08d3c36e7f32ef66b6a539854f72119ad9b6bc2 Mojolicious-7.0.tar.gz
+md5    97a935d64fc2aaf5538e6ab704bbc420 Mojolicious-7.20.tar.gz
+sha256 ddd034bdd2b99f64498f30b9859c2f2607318f43983dfe36e14bfdf1526fd693 Mojolicious-7.20.tar.gz
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 1bc31bb..b3e6615 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 7.0
+PERL_MOJOLICIOUS_VERSION = 7.20
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.7.4
