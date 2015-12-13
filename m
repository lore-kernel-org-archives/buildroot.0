From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 21:52:16 +0100
Subject: [Buildroot] [PATCH 2/4] package/perl-libwww-perl: bump version to
	6.15
In-Reply-To: <1450039938-32320-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450039938-32320-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1450039938-32320-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 1ef5ccf..ffc180f 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    85b36bcd2fd2450718ee14f894f0d3d1 libwww-perl-6.13.tar.gz
-sha256 5fbd13eebd1933e5a203fceb2c1629efbccff3efc8fab6ec0285c79d0a95f8b2 libwww-perl-6.13.tar.gz
+md5    6888c9d8728cd6f3ea3c9754461c9f94 libwww-perl-6.15.tar.gz
+sha256 6f349d45c21b1ec0501c4437dfcb70570940e6c3d5bff783bd91d4cddead8322 libwww-perl-6.15.tar.gz
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index d5cd195..594eb7d 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.13
+PERL_LIBWWW_PERL_VERSION = 6.15
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPLv1+
-- 
2.6.2
