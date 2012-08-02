From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:45 -0000
Subject: [Buildroot] [git commit branch/next] php: security bump to version
	5.3.14
Message-ID: <20120802195240.92E7088D21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74b442c8b41f466253b84fd4b529cd1a6bac2587
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump php to version 5.3.14 to fix CVE-2012-2143 and other assorted bugs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index af041c9..fee2c92 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.3.13
+PHP_VERSION = 5.3.14
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
