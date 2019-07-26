From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 23:16:04 +0200
Subject: [Buildroot] [git commit] package/perl-mojolicious: bump to version
 8.22
Message-ID: <20190726211404.4511387776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd4ef7555190214a6221243c4e853fa3b9ee05e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index da701dd8a4..65cb9ebb03 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    62a7925ce28403230cd920963043349a Mojolicious-8.15.tar.gz
-sha256 c8502b23e4f213544861f2040a34dfea72e3d1093355c24c70f12d65d077ecdb Mojolicious-8.15.tar.gz
+md5    278dca10c640deb56f0f3c06428ff543 Mojolicious-8.22.tar.gz
+sha256 86e34a50f7daeb7af43655d7b3bfe43bb09124216bfaf3016e6fd975c3f24854 Mojolicious-8.22.tar.gz
 
 # computed by scancpan
 sha256 19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 043525bd20..d7614b2d4f 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 8.15
+PERL_MOJOLICIOUS_VERSION = 8.22
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
