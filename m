From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Apr 2015 19:40:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-libwww: Fix legal-info
Message-ID: <1429551651-21509-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/6c6/6c6fb6001101ff528176b887ed8c95ef49313afb/
http://autobuild.buildroot.net/results/56d/56d42e7691d4eb1a682c49c0fa6c951d0e3069ec/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-libwww/perl-libwww.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/perl-libwww/perl-libwww.mk b/package/perl-libwww/perl-libwww.mk
index 0ee1e04..00b59c4 100644
--- a/package/perl-libwww/perl-libwww.mk
+++ b/package/perl-libwww/perl-libwww.mk
@@ -7,7 +7,6 @@
 PERL_LIBWWW_VERSION = 6.13
 PERL_LIBWWW_SITE = $(call github,libwww-perl,libwww-perl,$(PERL_LIBWWW_VERSION))
 PERL_LIBWWW_LICENSE = Artistic or GPLv1+
-PERL_LIBWWW_LICENSE_FILES = LICENSE
 PERL_LIBWWW_DEPENDENCIES = \
 	perl-encode-locale \
 	perl-file-listing \
-- 
1.7.10.4
