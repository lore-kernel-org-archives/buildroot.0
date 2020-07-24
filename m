From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jul 2020 18:21:20 +0200
Subject: [Buildroot] [PATCH 02/10] package/perl-file-util: bump to version
 4.201720
In-Reply-To: <20200724162128.2752535-1-francois.perrad@gadz.org>
References: <20200724162128.2752535-1-francois.perrad@gadz.org>
Message-ID: <20200724162128.2752535-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-file-util/perl-file-util.hash | 8 ++++----
 package/perl-file-util/perl-file-util.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-file-util/perl-file-util.hash b/package/perl-file-util/perl-file-util.hash
index 0915494f7..7e529e03e 100644
--- a/package/perl-file-util/perl-file-util.hash
+++ b/package/perl-file-util/perl-file-util.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    5706487ecf0daae885f709914915e832 File-Util-4.161950.tar.gz
-sha256 88507b19da580d595b5c25fe6ba75bbd6096b4359e389ead067a216f766c20ee File-Util-4.161950.tar.gz
+md5  093fe77c4658f98375c7f6cc68694948  File-Util-4.201720.tar.gz
+sha256  d4491021850d5c5cbd702c7e4744858079841d2fa93f1c2d09ddc9a7863608df  File-Util-4.201720.tar.gz
 
 # computed by scancpan
-sha256 5f3732812570654ba911e45ec4e5f7353f4b63747ebfc506c543e8fb1ccf797f COPYING
-sha256 48428fd07c402ea82d3556753ca936c7030f0d7a6a93c3ef09423c36820ffb91 LICENSE
+sha256  5f3732812570654ba911e45ec4e5f7353f4b63747ebfc506c543e8fb1ccf797f  COPYING
+sha256  996b77ca668f16a443ed14758fce492bddd9f55fe831ee8353274c89191b8544  LICENSE
diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
index 5437bc11c..4348b0e95 100644
--- a/package/perl-file-util/perl-file-util.mk
+++ b/package/perl-file-util/perl-file-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_UTIL_VERSION = 4.161950
+PERL_FILE_UTIL_VERSION = 4.201720
 PERL_FILE_UTIL_SOURCE = File-Util-$(PERL_FILE_UTIL_VERSION).tar.gz
 PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
 PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
-- 
2.25.1
