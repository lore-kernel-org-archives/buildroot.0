From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jul 2012 22:11:41 +0200
Subject: [Buildroot] [git commit] php: security bump to version 5.3.15
Message-ID: <20120723204911.EFB6096DF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60279fb153319504093e0d04cf9fb19689c23e6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix for CVE-2012-2688 (potential overflow in _php_stream_scandir),
CVE-2012-3365 (SQLite open_basedir bypass) and other misc bugfixes.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 31de289..0544659 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.3.14
+PHP_VERSION = 5.3.15
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
