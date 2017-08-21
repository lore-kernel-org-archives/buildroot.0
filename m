From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:40:51 +0200
Subject: [Buildroot] [git commit branch/next] perl-mail-dkim: bump to
	version 0.42
Message-ID: <20170821214002.7046E7FAE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5c319aa50af5b697b2330e49c690b4d698ac9c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index b6bb545..c40e66e 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9ceb8a0397aff83928e7a9760b1b190f Mail-DKIM-0.40.tar.gz
-sha256 3c5ea0c3a2028a5a2c3b64bbcd6bd9de6a5fa5ee4e16046dd8875c4796aaa6f1 Mail-DKIM-0.40.tar.gz
+md5    60ebe54760f6633f07b25228272b9473 Mail-DKIM-0.42.tar.gz
+sha256 f4e3a6344517aeee9a7516c0f58197f41dce81461f74ce9ba8401a143aa2577c Mail-DKIM-0.42.tar.gz
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index 03a3b74..e088ecf 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 0.40
+PERL_MAIL_DKIM_VERSION = 0.42
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
-PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JA/JASLONG
+PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_DEPENDENCIES = perl-crypt-openssl-rsa perl-mailtools perl-net-dns
-PERL_MAIL_DKIM_LICENSE_FILES = README
 
 $(eval $(perl-package))
