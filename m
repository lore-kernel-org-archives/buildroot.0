From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:34:30 +0200
Subject: [Buildroot] [git commit] package/perl-mojolicious: bump to version
 8.57
Message-ID: <20200725213109.11C6E8144E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b144705fe47210f13d7837fcd5e9cc956e8bd4d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 1f837cbd56..8802ba261f 100644
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
index 140c089ab3..edcbaf3d5f 100644
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
