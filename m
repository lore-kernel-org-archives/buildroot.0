From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  4 Dec 2019 09:33:48 +0100
Subject: [Buildroot] [PATCH 6/8] package/perl-mail-dkim: bump to version 0.58
In-Reply-To: <20191204083351.6134-1-francois.perrad@gadz.org>
References: <20191204083351.6134-1-francois.perrad@gadz.org>
Message-ID: <20191204083351.6134-6-francois.perrad@gadz.org>
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
index afa8aba50..86a638479 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a27333a8f3295c6a15e351cd3f725d92 Mail-DKIM-0.57.tar.gz
-sha256 6b535354408e842eada8f4a118f7c990ee21284145229685e128414d2c87ae3a Mail-DKIM-0.57.tar.gz
+md5    9b03bcd334cbf22a93fd94af9935e11b Mail-DKIM-0.58.tar.gz
+sha256 0a43a42b528a435f9e393171bf8ca1dc0cb54092f1d120d6299e615c0c55f331 Mail-DKIM-0.58.tar.gz
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index f532068c4..d331fe9d6 100644
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
-- 
2.20.1
