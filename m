From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:59:58 +0100
Subject: [Buildroot] [git commit] package/perl-mail-dkim: bump to version
 0.57
Message-ID: <20191028225558.298408C561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a15271ea1a465dfccc799495abde97531d37e201
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index e0e9532124..afa8aba500 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    76b9dd8a12e1f7ca2f0a5c097e7b8405 Mail-DKIM-0.55.tar.gz
-sha256 df29ddf187025b6a8dfc1387209b7fef35557fed51f8313bd1763ae35c80daa2 Mail-DKIM-0.55.tar.gz
+md5    a27333a8f3295c6a15e351cd3f725d92 Mail-DKIM-0.57.tar.gz
+sha256 6b535354408e842eada8f4a118f7c990ee21284145229685e128414d2c87ae3a Mail-DKIM-0.57.tar.gz
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index b63634c876..f532068c4b 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 0.55
+PERL_MAIL_DKIM_VERSION = 0.57
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_DISTNAME = Mail-DKIM
