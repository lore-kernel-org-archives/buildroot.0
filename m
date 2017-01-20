From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 20 Jan 2017 10:30:02 +0100
Subject: [Buildroot] [PATCH 09/12] perl-libwww-perl: bump to version 6.16
In-Reply-To: <1484904605-11239-1-git-send-email-francois.perrad@gadz.org>
References: <1484904605-11239-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1484904605-11239-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index ffc180f..d3b3328 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    6888c9d8728cd6f3ea3c9754461c9f94 libwww-perl-6.15.tar.gz
-sha256 6f349d45c21b1ec0501c4437dfcb70570940e6c3d5bff783bd91d4cddead8322 libwww-perl-6.15.tar.gz
+md5    0880fade10edcf5f60087e42f1db4481 libwww-perl-6.16.tar.gz
+sha256 daffd268000f92d241f8ae5508ae5616dbd02f15a587b4fbcd14998ccc15ce22 libwww-perl-6.16.tar.gz
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 594eb7d..8d4d00e 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.15
+PERL_LIBWWW_PERL_VERSION = 6.16
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
-PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
-PERL_LIBWWW_PERL_LICENSE = Artistic or GPLv1+
-PERL_LIBWWW_LICENSE_FILES = README
+PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_DEPENDENCIES = \
 	perl-encode-locale \
 	perl-file-listing \
@@ -22,5 +20,7 @@ PERL_LIBWWW_PERL_DEPENDENCIES = \
 	perl-net-http \
 	perl-uri \
 	perl-www-robotrules
+PERL_LIBWWW_PERL_LICENSE = Artistic or GPLv1+
+PERL_LIBWWW_PERL_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
-- 
2.7.4
