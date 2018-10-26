From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:20:15 +0200
Subject: [Buildroot] [git commit] perl-mail-dkim: bump to version 0.54
Message-ID: <20181026191920.0988D8910C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a30274ae89f76cc6f61405836eef5278084921bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index 99b3e7cce3..6d0b079706 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    f366863f09905bbe5faa1f986133759c Mail-DKIM-0.52.tar.gz
-sha256 9eaf0b212af1883b9c3f709dcf4811e46122546a38ae979a08756fbfcffb6cb5 Mail-DKIM-0.52.tar.gz
+md5    7f65cb291545aa10fa9d0d87d0e8d1d2 Mail-DKIM-0.54.tar.gz
+sha256 b72f78c80f7aa1bdb2a80986b45f9225a8fa0b7c91644590b102a78eb31c3dca Mail-DKIM-0.54.tar.gz
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index 6705f68703..986df27cbc 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 0.52
+PERL_MAIL_DKIM_VERSION = 0.54
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_DISTNAME = Mail-DKIM
