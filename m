From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:31:21 +0200
Subject: [Buildroot] [git commit] package/perl-http-message: bump to version
 6.25
Message-ID: <20200725213108.E1DA68144E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f97e7a73081428f0589db69a7ed55ef40a2f2f67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 99464e3ba1..c220d5f824 100644
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
index d802c258df..cb8a1d94b5 100644
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
