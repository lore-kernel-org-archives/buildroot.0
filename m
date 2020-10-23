From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Oct 2020 22:07:21 +0200
Subject: [Buildroot] [PATCH 07/11] package/perl-mojolicious: bump to version
 8.63
In-Reply-To: <20201023200725.1407498-1-francois.perrad@gadz.org>
References: <20201023200725.1407498-1-francois.perrad@gadz.org>
Message-ID: <20201023200725.1407498-7-francois.perrad@gadz.org>
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
index 8802ba261..65a3b641a 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  c5110e47f83a7fb0d6369ea12458652f  Mojolicious-8.57.tar.gz
-sha256  baa310e3859fe83df421acb467cc07694dcc58d06d936d06584b4679a8d5bada  Mojolicious-8.57.tar.gz
+md5  7033bd9404776d92b48c0f86b81a0983  Mojolicious-8.63.tar.gz
+sha256  c62cc22d8a43982f6f81d47da6875f77ba6fbaa56760251857be4d13390085db  Mojolicious-8.63.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index edcbaf3d5..049783ff3 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 8.57
+PERL_MOJOLICIOUS_VERSION = 8.63
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.25.1
