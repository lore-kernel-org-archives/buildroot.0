From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jun 2013 14:09:27 +0200
Subject: [Buildroot] [git commit] php: security bump to version 5.3.26
Message-ID: <20130610123723.63BA99AB9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec6bd7cdee887e0534f06b60990a8bcd33f6289c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-2110.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index ea148fb..07f396e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.3.25
+PHP_VERSION = 5.3.26
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
