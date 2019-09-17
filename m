From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:28:38 +0200
Subject: [Buildroot] [git commit] package/perl-mailtools: bump to version
 2.21
Message-ID: <20190917202405.D96C281EFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=822452f5f468d4afc7ac94e62b37d31ac2f0b5d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file hash has changed, due to changes in the installation
instructions.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mailtools/Config.in           | 2 +-
 package/perl-mailtools/perl-mailtools.hash | 6 +++---
 package/perl-mailtools/perl-mailtools.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-mailtools/Config.in b/package/perl-mailtools/Config.in
index a442e7193d..6aa5d2d055 100644
--- a/package/perl-mailtools/Config.in
+++ b/package/perl-mailtools/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PERL_MAILTOOLS
 	help
 	  Various ancient e-mail related modules.
 
-	  https://metacpan.org/release/MailTools
+	  http://perl.overmeer.net/CPAN/
diff --git a/package/perl-mailtools/perl-mailtools.hash b/package/perl-mailtools/perl-mailtools.hash
index 1db4772f56..bf8b17a5b9 100644
--- a/package/perl-mailtools/perl-mailtools.hash
+++ b/package/perl-mailtools/perl-mailtools.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    53e9d35256c3fd7cef0e4a24b15e9512 MailTools-2.20.tar.gz
-sha256 f55606f7a9cc342ee9d5f996e2b6a4c0047e2ee47cd88c3250ecf0d0c5fb3196 MailTools-2.20.tar.gz
+md5    69ee516d40011e7e92b77c6f06c0dc01 MailTools-2.21.tar.gz
+sha256 4ad9bd6826b6f03a2727332466b1b7d29890c8d99a32b4b3b0a8d926ee1a44cb MailTools-2.21.tar.gz
 
 # computed by scancpan
-sha256 734d5b1bd212de832aea99e94c98d56217ea9519d900a29c0547538f596a9b26 README
+sha256 f7558badc4f4875df247bcccb50a8f369bfe4a2c19361f1df7b26ddf6aaaaf6b README
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index ef58849b98..900ee41ff5 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAILTOOLS_VERSION = 2.20
+PERL_MAILTOOLS_VERSION = 2.21
 PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
 PERL_MAILTOOLS_LICENSE = Artistic or GPL-1.0+
