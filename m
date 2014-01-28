From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 22:46:22 +0100
Subject: [Buildroot] [git commit] php: security bump to version 5.5.8
Message-ID: <20140128214755.6C83B9C6AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8fd2b3ed65e5d98fc817ed55e7494f484744e14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-6712.
Note that there's no xz format tarball for 5.5.8.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 54d6e05..de02f4b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.7
-PHP_SOURCE = php-$(PHP_VERSION).tar.xz
+PHP_VERSION = 5.5.8
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
