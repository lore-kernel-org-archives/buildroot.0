From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 22 Jan 2021 19:30:12 +0100
Subject: [Buildroot] [PATCH 02/10] package/perl-http-message: bump to
 version 6.27
In-Reply-To: <20210122183020.874889-1-francois.perrad@gadz.org>
References: <20210122183020.874889-1-francois.perrad@gadz.org>
Message-ID: <20210122183020.874889-2-francois.perrad@gadz.org>
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
index 989d7efd0..4e406c9d4 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  3b4b64fff4885429b997390564521db0  HTTP-Message-6.26.tar.gz
-sha256  6ce6c359de75c3bb86696a390189b485ec93e3ffc55326b6d044fa900f1725e1  HTTP-Message-6.26.tar.gz
+md5  4b4038aef74f63c2b6baca189c6c6602  HTTP-Message-6.27.tar.gz
+sha256  0be0f720fbbbdbae8711f6eec9b2f0d34bd5ed5046fc66b80dc3b42017c1e699  HTTP-Message-6.27.tar.gz
 
 # computed by scancpan
 sha256  1379396dcd2291f17a741d2d6bf14d379f5f2ab91b3c7e7b92c5f82856e2d7ac  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 114fc8000..72b94356b 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.26
+PERL_HTTP_MESSAGE_VERSION = 6.27
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
-- 
2.27.0
