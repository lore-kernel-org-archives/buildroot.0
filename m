From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 22:34:15 +0200
Subject: [Buildroot] [git commit] package/perl-http-message: bump to version
 6.24
Message-ID: <20200605203650.A46CC82616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=719da45da9e7bf610d7ba0ce22fd10573c96fc72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE diff:
- This software is copyright (c) 1994-2017 by Gisle Aas.
+ This software is copyright (c) 1994 by Gisle Aas.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-http-message/perl-http-message.hash | 6 +++---
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 80e117cffe..99464e3ba1 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    3cfb96e96c1881afa72639a8f4282e86 HTTP-Message-6.22.tar.gz
-sha256 970efd151b81c95831d2a5f9e117f8032b63a1768cd2cd3f092ad634c85175c3 HTTP-Message-6.22.tar.gz
+md5  d1d1dc1f83ece90bd0503b4495274955  HTTP-Message-6.24.tar.gz
+sha256  554a1acf2daa401091f7012f5cb82d04d281db43fbd8f39a1fcbb7ed56dde16d  HTTP-Message-6.24.tar.gz
 
 # computed by scancpan
-sha256 66f0d1e8593d5512d7a8cd90549a976aaae97e4fa9b6097249b3682f14747a6b LICENSE
+sha256  1379396dcd2291f17a741d2d6bf14d379f5f2ab91b3c7e7b92c5f82856e2d7ac  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index c80d884054..d802c258df 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.22
+PERL_HTTP_MESSAGE_VERSION = 6.24
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
