From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 22:02:47 +0200
Subject: [Buildroot] [git commit branch/next] package/perl-uri: bump version
 to 1.74
Message-ID: <20180511200232.43F918C9E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e025497175b3ef36b738601b017bb0706e5c134c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-uri/perl-uri.hash | 6 ++++--
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index 5f27230e5e..c8bf47d437 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,3 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    37d44a08e599aa945b32a9434ffe00a5 URI-1.73.tar.gz
-sha256 cca7ab4a6f63f3ccaacae0f2e1337e8edf84137e73f18548ec7d659f23efe413 URI-1.73.tar.gz
+md5    892f7183b178af40f205ba37128225db URI-1.74.tar.gz
+sha256 a9c254f45f89cb1dd946b689dfe433095404532a4543bdaab0b71ce0fdcdd53d URI-1.74.tar.gz
+# Locally computed
+sha256 65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 690a0eb8c7..10a5bb8bda 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 1.73
+PERL_URI_VERSION = 1.74
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_URI_LICENSE = Artistic or GPL-1.0+
