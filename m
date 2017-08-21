From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:40:45 +0200
Subject: [Buildroot] [git commit branch/next] perl-file-util: bump to
	version 4.161950
Message-ID: <20170821214001.D97D6821DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f23c584bc030f7823f9b2c86a9c7f9c5b6d4bc8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-file-util/perl-file-util.hash | 4 ++--
 package/perl-file-util/perl-file-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-file-util/perl-file-util.hash b/package/perl-file-util/perl-file-util.hash
index 1e613dc..dc3e59e 100644
--- a/package/perl-file-util/perl-file-util.hash
+++ b/package/perl-file-util/perl-file-util.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    93c572b4c54743a7ef383486dd2c4014 File-Util-4.132140.tar.gz
-sha256 4233c493468da8b34f2df19b191aaa400f328d877c8c023605e43385976a99d1 File-Util-4.132140.tar.gz
+md5    5706487ecf0daae885f709914915e832 File-Util-4.161950.tar.gz
+sha256 88507b19da580d595b5c25fe6ba75bbd6096b4359e389ead067a216f766c20ee File-Util-4.161950.tar.gz
diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
index 723cc7a..f8f2712 100644
--- a/package/perl-file-util/perl-file-util.mk
+++ b/package/perl-file-util/perl-file-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_UTIL_VERSION = 4.132140
+PERL_FILE_UTIL_VERSION = 4.161950
 PERL_FILE_UTIL_SOURCE = File-Util-$(PERL_FILE_UTIL_VERSION).tar.gz
 PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
 PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
