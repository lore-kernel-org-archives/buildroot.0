From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:03:21 +0200
Subject: [Buildroot] [PATCH 08/18] perl-mojolicious: bump to version 7.43
In-Reply-To: <20170820080331.12935-1-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
Message-ID: <20170820080331.12935-8-francois.perrad@gadz.org>
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
index 21b2768b8..45bfd5ac5 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    97a935d64fc2aaf5538e6ab704bbc420 Mojolicious-7.20.tar.gz
-sha256 ddd034bdd2b99f64498f30b9859c2f2607318f43983dfe36e14bfdf1526fd693 Mojolicious-7.20.tar.gz
+md5    a07d9d3fc06a35cc7336b35e6e531e43 Mojolicious-7.43.tar.gz
+sha256 ca177da7b0c1e2a31a1880c4a06afbbd1ada1da57146bfa030b7912a3d608b5e Mojolicious-7.43.tar.gz
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index b3e6615f2..b3bec15e6 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 7.20
+PERL_MOJOLICIOUS_VERSION = 7.43
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.11.0
