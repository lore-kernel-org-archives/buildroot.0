From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 14:39:05 +0100
Subject: [Buildroot] [git commit] package/perl-plack: bump to version 1.0048
Message-ID: <20201205132743.D398A7FCEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e9810e532db220f00dbb0248af6ee59c43b7bba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-plack/perl-plack.hash | 6 +++---
 package/perl-plack/perl-plack.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-plack/perl-plack.hash b/package/perl-plack/perl-plack.hash
index 7324b726ae..c763d2c173 100644
--- a/package/perl-plack/perl-plack.hash
+++ b/package/perl-plack/perl-plack.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9d37086aec1b29bab52a9575687e3557 Plack-1.0047.tar.gz
-sha256 322c93f5acc0a0f0e11fd4a76188f978bdc14338a9f1df3ae535227017046561 Plack-1.0047.tar.gz
+md5  36282b473b4521219c44a9db437b650f  Plack-1.0048.tar.gz
+sha256  30f5f25e19b437859156a2526f61ca9ab708d50d5730c279189403aabfe542a6  Plack-1.0048.tar.gz
 
 # computed by scancpan
-sha256 fb67655b5d1adedef83aed2c79bf4f89c68d8595a7060815520173f663a3631d LICENSE
+sha256  fb67655b5d1adedef83aed2c79bf4f89c68d8595a7060815520173f663a3631d  LICENSE
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index cccf5a6224..b95f204d23 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PLACK_VERSION = 1.0047
+PERL_PLACK_VERSION = 1.0048
 PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
 PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
