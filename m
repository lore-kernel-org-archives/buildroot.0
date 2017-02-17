From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Feb 2017 16:10:54 +0100
Subject: [Buildroot] [git commit branch/next] perl-cross: bump to version
	1.1.4
Message-ID: <20170217151112.4597182255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cda721e1a54004f0857992e66470a9a5dec0c8e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 4 ++--
 package/perl/perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 41c1ce8..b815295 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -3,5 +3,5 @@ md5    af6a84c7c3e2b8b269c105a5db2f6d53                                 perl-5.2
 sha1   5bec25d8821b81a5939ee220997f4c8ab1c13e31                         perl-5.24.1.tar.xz
 sha256 03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f perl-5.24.1.tar.xz
 
-# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.3/perl-cross-1.1.3.hash
-sha256 181b24ff71815fb2c8065e6ea139d106796eee0964aebfd8081f0b7f69e0696d perl-cross-1.1.3.tar.gz
+# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.4/perl-cross-1.1.4.hash
+sha256 c840a327d5464ca271cac40d52e2d199330875527bf1003c28a6e550fb7bcc57 perl-cross-1.1.4.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 224b4cb..b407e05 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -13,7 +13,7 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.3
+PERL_CROSS_VERSION = 1.1.4
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
