From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:34:33 +0200
Subject: [Buildroot] [git commit] package/perl-mail-dkim: bump to version
 1.20200708
Message-ID: <20200725213109.29EDD8144E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5f82f94edc91da120d5fbfc6dbd93396c58bbf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- new scheme for version
- LICENSE file added

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 7 +++++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 4 +++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index 86a6384799..99ba275d7a 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9b03bcd334cbf22a93fd94af9935e11b Mail-DKIM-0.58.tar.gz
-sha256 0a43a42b528a435f9e393171bf8ca1dc0cb54092f1d120d6299e615c0c55f331 Mail-DKIM-0.58.tar.gz
+md5  f911799d8b9418ea1299323587ad7319  Mail-DKIM-1.20200708.tar.gz
+sha256  d9d21f4f9960a174d45f9660ab5d52db667b9af57182ff4e4d7fc33316a51e54  Mail-DKIM-1.20200708.tar.gz
+
+# computed by scancpan
+sha256  ffaa40feb768566e52d93879fedd2c5483828b6de483874f30a0a4425351555f  LICENSE
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index d331fe9d64..5d45f0335e 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 0.58
+PERL_MAIL_DKIM_VERSION = 1.20200708
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
+PERL_MAIL_DKIM_LICENSE = Artistic or GPL-1.0+
+PERL_MAIL_DKIM_LICENSE_FILES = LICENSE
 PERL_MAIL_DKIM_DISTNAME = Mail-DKIM
 
 $(eval $(perl-package))
