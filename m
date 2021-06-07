From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  7 Jun 2021 19:56:00 +0200
Subject: [Buildroot] [PATCH 2/6] package/perl-http-message: bump to version
 6.32
In-Reply-To: <20210607175604.2850795-1-francois.perrad@gadz.org>
References: <20210607175604.2850795-1-francois.perrad@gadz.org>
Message-ID: <20210607175604.2850795-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index a074bb4cb..2728a2690 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  058f0598ee52a816ccb1d9dceb798520  HTTP-Message-6.29.tar.gz
-sha256  f4417970679e08f6deb0609009aa9515dee0c8d91dbadd6b86a26e2b8e0d6341  HTTP-Message-6.29.tar.gz
+md5  703551d67da8ba7ecbe0955d7c7a325d  HTTP-Message-6.32.tar.gz
+sha256  ac32960ce01a3ae4a950666736f2bd633fb694c60ad545adaad9cb5fe5c12278  HTTP-Message-6.32.tar.gz
 
 # computed by scancpan
 sha256  1379396dcd2291f17a741d2d6bf14d379f5f2ab91b3c7e7b92c5f82856e2d7ac  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 1b3a93d7c..1cdac5def 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.29
+PERL_HTTP_MESSAGE_VERSION = 6.32
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2
