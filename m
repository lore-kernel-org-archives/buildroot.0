From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 11:23:16 +0100
Subject: [Buildroot] [git commit] perl-uri: bump to version 1.76
Message-ID: <20190127102332.872F08E255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df9b13e674dc0ce0616db8f678875e9910813753
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index 4ef17ece64..02287a0645 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    892f7183b178af40f205ba37128225db URI-1.74.tar.gz
-sha256 a9c254f45f89cb1dd946b689dfe433095404532a4543bdaab0b71ce0fdcdd53d URI-1.74.tar.gz
+md5    c236e0142adecc1b1104da664bc43a79 URI-1.76.tar.gz
+sha256 b2c98e1d50d6f572483ee538a6f4ccc8d9185f91f0073fd8af7390898254413e URI-1.76.tar.gz
 
 # computed by scancpan
 sha256 65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 5be4401314..730b390526 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 1.74
+PERL_URI_VERSION = 1.76
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
-PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic or GPL-1.0+
 PERL_URI_LICENSE_FILES = LICENSE
 PERL_URI_DISTNAME = URI
