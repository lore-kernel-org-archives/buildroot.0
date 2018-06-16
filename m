From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 14:29:48 +0200
Subject: [Buildroot] [git commit] perl-mojolicious: bump to version 7.84
Message-ID: <20180616122909.73A898849C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=664f5b45bc43122145d99acf431f8f49ad076517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mojolicious/Config.in             | 2 +-
 package/perl-mojolicious/perl-mojolicious.hash | 7 +++++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/perl-mojolicious/Config.in b/package/perl-mojolicious/Config.in
index ebf0932b9f..28d45a35fd 100644
--- a/package/perl-mojolicious/Config.in
+++ b/package/perl-mojolicious/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PERL_MOJOLICIOUS
 	help
 	  Real-time web framework
 
-	  http://mojolicious.org
+	  https://mojolicious.org
diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 0593a3cc62..528fb7a731 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    47d198ea987b4913818c24107cd9673d Mojolicious-7.61.tar.gz
-sha256 386ade41021bf0470879a0abceeccc305f773b41b76245cc3cdce92d7dc8897d Mojolicious-7.61.tar.gz
+md5    2aca5046a2efc7ce596c4470893b555f Mojolicious-7.84.tar.gz
+sha256 7461a27e8e8665b436a60c708cf6ce4164b84dfb1b2435480a65597085d26ebc Mojolicious-7.84.tar.gz
+
+# computed by scancpan
+sha256 19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 4e94c47a71..f20fabc9fa 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 7.61
+PERL_MOJOLICIOUS_VERSION = 7.84
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
