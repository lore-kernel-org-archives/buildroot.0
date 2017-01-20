From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 20:30:15 +0100
Subject: [Buildroot] [git commit] perl-mailtools: bump to version 2.18
Message-ID: <20170120194046.6E15880DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e77e384cdf2d85f1233bcaa811b4303057caee4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-mailtools/perl-mailtools.hash | 4 ++--
 package/perl-mailtools/perl-mailtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mailtools/perl-mailtools.hash b/package/perl-mailtools/perl-mailtools.hash
index b67867a..65a424b 100644
--- a/package/perl-mailtools/perl-mailtools.hash
+++ b/package/perl-mailtools/perl-mailtools.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    813ae849683367bb75e6be89e4e8cc46 MailTools-2.14.tar.gz
-sha256 4b7c7ef674b2ef75ea793f053cd067c6a4b33e58e3adf08a89c8ea4c56b3dff8 MailTools-2.14.tar.gz
+md5    972468ab5207b90398d77bed4ffc361d MailTools-2.18.tar.gz
+sha256 dfee9e770257371112f20d978e637759e81bc4f19e97b083585c71ecab37b527 MailTools-2.18.tar.gz
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index d3c049d..1c41831 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAILTOOLS_VERSION = 2.14
+PERL_MAILTOOLS_VERSION = 2.18
 PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
 PERL_MAILTOOLS_DEPENDENCIES = perl-timedate
