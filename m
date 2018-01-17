From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:36:32 +0100
Subject: [Buildroot] [git commit] perl-mailtools: bump to version 2.19
Message-ID: <20180117213712.6A72383F1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc599be83bef78358d981f35c700158225f421b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-mailtools/Config.in           | 2 +-
 package/perl-mailtools/perl-mailtools.hash | 4 ++--
 package/perl-mailtools/perl-mailtools.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mailtools/Config.in b/package/perl-mailtools/Config.in
index e02d3cb..2123c61 100644
--- a/package/perl-mailtools/Config.in
+++ b/package/perl-mailtools/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_MAILTOOLS
 	bool "perl-mailtools"
 	select BR2_PACKAGE_PERL_TIMEDATE
 	help
-	  Various e-mail related modules
+	  Various ancient e-mail related modules
 
 	  https://metacpan.org/release/MailTools
diff --git a/package/perl-mailtools/perl-mailtools.hash b/package/perl-mailtools/perl-mailtools.hash
index 65a424b..cb33453 100644
--- a/package/perl-mailtools/perl-mailtools.hash
+++ b/package/perl-mailtools/perl-mailtools.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    972468ab5207b90398d77bed4ffc361d MailTools-2.18.tar.gz
-sha256 dfee9e770257371112f20d978e637759e81bc4f19e97b083585c71ecab37b527 MailTools-2.18.tar.gz
+md5    a00b9d3c3dec64bd15de8c50f1b73d05 MailTools-2.19.tar.gz
+sha256 c17ed702efea8eab56fe92961c07cd4980cee26ca6f13aff2688dc8af69c5e1a MailTools-2.19.tar.gz
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index bddaf9f..75079f9 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAILTOOLS_VERSION = 2.18
+PERL_MAILTOOLS_VERSION = 2.19
 PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
 PERL_MAILTOOLS_DEPENDENCIES = perl-timedate
