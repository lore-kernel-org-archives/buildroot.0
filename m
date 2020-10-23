From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Oct 2020 22:07:20 +0200
Subject: [Buildroot] [PATCH 06/11] package/perl-libwww-perl: bump to version
 6.49
In-Reply-To: <20201023200725.1407498-1-francois.perrad@gadz.org>
References: <20201023200725.1407498-1-francois.perrad@gadz.org>
Message-ID: <20201023200725.1407498-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index e519f7966..58cb2e847 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  fe42c3f99fd8d1438d383f820c89d9bd  libwww-perl-6.47.tar.gz
-sha256  3029d6efc2099c4175bf976d0db7fbab9771ada631010c809cb4664230898f53  libwww-perl-6.47.tar.gz
+md5  86601652f46b924a26acecad0fe5c110  libwww-perl-6.49.tar.gz
+sha256  c3e4d0deae254c8b8fdc13e14b7b4b893594c947c43f4b5401e06322c96360a6  libwww-perl-6.49.tar.gz
 
 # computed by scancpan
 sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 01428f91e..d749b1b60 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.47
+PERL_LIBWWW_PERL_VERSION = 6.49
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.25.1
