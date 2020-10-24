From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:26:31 +0200
Subject: [Buildroot] [git commit] package/perl-http-message: bump to version
 6.26
Message-ID: <20201024201639.97E158443E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1bc4da4e5d2057a47eeebba6ca992ea3c570666
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index c220d5f824..989d7efd0e 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  8847fe62ec103a242d39194c9e3c647e  HTTP-Message-6.25.tar.gz
-sha256  21f46502e87d57f43b7a38f81916464b079f5d50fe529458391c0ad529e0075a  HTTP-Message-6.25.tar.gz
+md5  3b4b64fff4885429b997390564521db0  HTTP-Message-6.26.tar.gz
+sha256  6ce6c359de75c3bb86696a390189b485ec93e3ffc55326b6d044fa900f1725e1  HTTP-Message-6.26.tar.gz
 
 # computed by scancpan
 sha256  1379396dcd2291f17a741d2d6bf14d379f5f2ab91b3c7e7b92c5f82856e2d7ac  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index cb8a1d94b5..114fc80008 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.25
+PERL_HTTP_MESSAGE_VERSION = 6.26
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
-PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_MESSAGE_LICENSE_FILES = LICENSE
 PERL_HTTP_MESSAGE_DISTNAME = HTTP-Message
