From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 15:53:52 +0200
Subject: [Buildroot] [git commit] package/perl-digest-hmac: bump version to
 1.04
Message-ID: <20210403132859.C56DA8A3C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c38872a46cd6b546b7eea63e502347fae2253764
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added by scancpan:
- new project URL
- new SITE
- new license file
- reformatted hashes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-digest-hmac/Config.in             | 2 +-
 package/perl-digest-hmac/perl-digest-hmac.hash | 6 +++---
 package/perl-digest-hmac/perl-digest-hmac.mk   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-digest-hmac/Config.in b/package/perl-digest-hmac/Config.in
index bb9b454174..e8bb880020 100644
--- a/package/perl-digest-hmac/Config.in
+++ b/package/perl-digest-hmac/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PERL_DIGEST_HMAC
 	help
 	  Keyed-Hashing for Message Authentication.
 
-	  https://metacpan.org/release/Digest-HMAC
+	  http://metacpan.org/release/Digest-HMAC
diff --git a/package/perl-digest-hmac/perl-digest-hmac.hash b/package/perl-digest-hmac/perl-digest-hmac.hash
index 84bc86488a..5e7da14f3f 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.hash
+++ b/package/perl-digest-hmac/perl-digest-hmac.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e6a5d6f552da16eacb5157ea4369ff9d Digest-HMAC-1.03.tar.gz
-sha256 3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ecfb8985ba96da4a59 Digest-HMAC-1.03.tar.gz
+md5  746a5edffd1485d7500e005730c271c8  Digest-HMAC-1.04.tar.gz
+sha256  d6bc8156aa275c44d794b7c18f44cdac4a58140245c959e6b19b2c3838b08ed4  Digest-HMAC-1.04.tar.gz
 
 # computed by scancpan
-sha256 56bf7cdaec5eebf74d58679638ebef5015883e65c1be7251a3ef8cce8bdd1ff5 README
+sha256  cb9ff694d1769f450dd5c400204aa921d2fb3db90fcb21674a39f3725c4255c1  LICENSE
diff --git a/package/perl-digest-hmac/perl-digest-hmac.mk b/package/perl-digest-hmac/perl-digest-hmac.mk
index daacf7dab4..bc080703de 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.mk
+++ b/package/perl-digest-hmac/perl-digest-hmac.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_DIGEST_HMAC_VERSION = 1.03
+PERL_DIGEST_HMAC_VERSION = 1.04
 PERL_DIGEST_HMAC_SOURCE = Digest-HMAC-$(PERL_DIGEST_HMAC_VERSION).tar.gz
-PERL_DIGEST_HMAC_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_DIGEST_HMAC_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AR/ARODLAND
 PERL_DIGEST_HMAC_LICENSE = Artistic or GPL-1.0+
-PERL_DIGEST_HMAC_LICENSE_FILES = README
+PERL_DIGEST_HMAC_LICENSE_FILES = LICENSE
 PERL_DIGEST_HMAC_DISTNAME = Digest-HMAC
 
 $(eval $(perl-package))
