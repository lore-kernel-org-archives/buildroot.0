From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 11 May 2018 13:58:07 +0200
Subject: [Buildroot] [PATCH/next 4/6] package/perl-mail-dkim: bump version
 to 0.52
In-Reply-To: <20180511115809.1647-1-bernd.kuhls@t-online.de>
References: <20180511115809.1647-1-bernd.kuhls@t-online.de>
Message-ID: <20180511115809.1647-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index c40e66e995..99b3e7cce3 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    60ebe54760f6633f07b25228272b9473 Mail-DKIM-0.42.tar.gz
-sha256 f4e3a6344517aeee9a7516c0f58197f41dce81461f74ce9ba8401a143aa2577c Mail-DKIM-0.42.tar.gz
+md5    f366863f09905bbe5faa1f986133759c Mail-DKIM-0.52.tar.gz
+sha256 9eaf0b212af1883b9c3f709dcf4811e46122546a38ae979a08756fbfcffb6cb5 Mail-DKIM-0.52.tar.gz
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index e088ecf1a5..e6bfd7bd83 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 0.42
+PERL_MAIL_DKIM_VERSION = 0.52
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_DEPENDENCIES = perl-crypt-openssl-rsa perl-mailtools perl-net-dns
-- 
2.14.2
