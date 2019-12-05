From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:18:13 +0100
Subject: [Buildroot] [git commit] package/perl-mail-dkim: bump to version
 0.58
Message-ID: <20191205221012.C2A6980E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90b23e1eca63e6adf7f365f87b561b02c6bc205f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index afa8aba500..86a6384799 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a27333a8f3295c6a15e351cd3f725d92 Mail-DKIM-0.57.tar.gz
-sha256 6b535354408e842eada8f4a118f7c990ee21284145229685e128414d2c87ae3a Mail-DKIM-0.57.tar.gz
+md5    9b03bcd334cbf22a93fd94af9935e11b Mail-DKIM-0.58.tar.gz
+sha256 0a43a42b528a435f9e393171bf8ca1dc0cb54092f1d120d6299e615c0c55f331 Mail-DKIM-0.58.tar.gz
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index f532068c4b..d331fe9d64 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 0.57
+PERL_MAIL_DKIM_VERSION = 0.58
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_DISTNAME = Mail-DKIM
