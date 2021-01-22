From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 22 Jan 2021 19:30:20 +0100
Subject: [Buildroot] [PATCH 10/10] package/perl-mojolicious: bump to version
 8.71
In-Reply-To: <20210122183020.874889-1-francois.perrad@gadz.org>
References: <20210122183020.874889-1-francois.perrad@gadz.org>
Message-ID: <20210122183020.874889-10-francois.perrad@gadz.org>
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
index 65a3b641a..a94c57abc 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  7033bd9404776d92b48c0f86b81a0983  Mojolicious-8.63.tar.gz
-sha256  c62cc22d8a43982f6f81d47da6875f77ba6fbaa56760251857be4d13390085db  Mojolicious-8.63.tar.gz
+md5  f93e56c64cad7002bd7bc1f8091ed05b  Mojolicious-8.71.tar.gz
+sha256  155bfdcd1d49f4f10be71ec8eeb93de1873b9ab810f3d6d521d3ec10f0ef6e0d  Mojolicious-8.71.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 049783ff3..eed097d90 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 8.63
+PERL_MOJOLICIOUS_VERSION = 8.71
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.27.0
