From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2020 21:24:43 +0200
Subject: [Buildroot] [git commit] package/perl-mail-dkim: bump to version
 1.20200824
Message-ID: <20200903191701.27A777FB32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaed10e4020fcd60b36febcad3c308740b0d24d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index 99ba275d7a..e94adfc6ed 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  f911799d8b9418ea1299323587ad7319  Mail-DKIM-1.20200708.tar.gz
-sha256  d9d21f4f9960a174d45f9660ab5d52db667b9af57182ff4e4d7fc33316a51e54  Mail-DKIM-1.20200708.tar.gz
+md5  9de35f8aa77a85dc17423cbcce2bf46d  Mail-DKIM-1.20200824.tar.gz
+sha256  871d329830acb4840423aa59036622fb2ee394efc1d09316dcc32ae94454e916  Mail-DKIM-1.20200824.tar.gz
 
 # computed by scancpan
 sha256  ffaa40feb768566e52d93879fedd2c5483828b6de483874f30a0a4425351555f  LICENSE
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index 5d45f0335e..e67bf5ee18 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 1.20200708
+PERL_MAIL_DKIM_VERSION = 1.20200824
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_LICENSE = Artistic or GPL-1.0+
