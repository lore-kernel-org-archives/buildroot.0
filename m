From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jul 2020 18:21:23 +0200
Subject: [Buildroot] [PATCH 05/10] package/perl-http-message: bump to
 version 6.25
In-Reply-To: <20200724162128.2752535-1-francois.perrad@gadz.org>
References: <20200724162128.2752535-1-francois.perrad@gadz.org>
Message-ID: <20200724162128.2752535-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 99464e3ba..c220d5f82 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  d1d1dc1f83ece90bd0503b4495274955  HTTP-Message-6.24.tar.gz
-sha256  554a1acf2daa401091f7012f5cb82d04d281db43fbd8f39a1fcbb7ed56dde16d  HTTP-Message-6.24.tar.gz
+md5  8847fe62ec103a242d39194c9e3c647e  HTTP-Message-6.25.tar.gz
+sha256  21f46502e87d57f43b7a38f81916464b079f5d50fe529458391c0ad529e0075a  HTTP-Message-6.25.tar.gz
 
 # computed by scancpan
 sha256  1379396dcd2291f17a741d2d6bf14d379f5f2ab91b3c7e7b92c5f82856e2d7ac  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index d802c258d..cb8a1d94b 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.24
+PERL_HTTP_MESSAGE_VERSION = 6.25
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
-PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_MESSAGE_LICENSE_FILES = LICENSE
 PERL_HTTP_MESSAGE_DISTNAME = HTTP-Message
-- 
2.25.1
