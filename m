From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 27 Apr 2019 09:05:19 +0200
Subject: [Buildroot] [PATCH 2/4] package/perl-mail-dkim: bump to version 0.55
In-Reply-To: <20190427070521.27791-1-francois.perrad@gadz.org>
References: <20190427070521.27791-1-francois.perrad@gadz.org>
Message-ID: <20190427070521.27791-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index 6d0b07970..e0e953212 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7f65cb291545aa10fa9d0d87d0e8d1d2 Mail-DKIM-0.54.tar.gz
-sha256 b72f78c80f7aa1bdb2a80986b45f9225a8fa0b7c91644590b102a78eb31c3dca Mail-DKIM-0.54.tar.gz
+md5    76b9dd8a12e1f7ca2f0a5c097e7b8405 Mail-DKIM-0.55.tar.gz
+sha256 df29ddf187025b6a8dfc1387209b7fef35557fed51f8313bd1763ae35c80daa2 Mail-DKIM-0.55.tar.gz
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index 986df27cb..b63634c87 100644
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
-- 
2.20.1
