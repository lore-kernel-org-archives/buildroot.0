From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Apr 2019 14:24:36 +0200
Subject: [Buildroot] [git commit] package/perl-mail-dkim: bump to version
 0.55
Message-ID: <20190427121957.064888156E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8887825a8b067def73155a25e65e2a401ee52d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index 6d0b079706..e0e9532124 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7f65cb291545aa10fa9d0d87d0e8d1d2 Mail-DKIM-0.54.tar.gz
-sha256 b72f78c80f7aa1bdb2a80986b45f9225a8fa0b7c91644590b102a78eb31c3dca Mail-DKIM-0.54.tar.gz
+md5    76b9dd8a12e1f7ca2f0a5c097e7b8405 Mail-DKIM-0.55.tar.gz
+sha256 df29ddf187025b6a8dfc1387209b7fef35557fed51f8313bd1763ae35c80daa2 Mail-DKIM-0.55.tar.gz
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index 986df27cbc..b63634c876 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 0.54
+PERL_MAIL_DKIM_VERSION = 0.55
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_DISTNAME = Mail-DKIM
