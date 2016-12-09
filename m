From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 18:12:37 +0100
Subject: [Buildroot] [git commit] php: security bump to version 7.0.14
Message-ID: <20161209171846.6B32180102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2483170d3258ee3e805ead6f0ebafe9fc6765c19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index f1cd346..0424e46 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 357ba7f93975d7d836abed0852dc3ed96a988af539e87750613294cbee82f1bf  php-7.0.13.tar.xz
+sha256 0f1dff6392a1cc2ed126b9695f580a2ed77eb09d2c23b41cabfb41e6f27a8c89  php-7.0.14.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index c8abe66..8c1ccef 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.0.13
+PHP_VERSION = 7.0.14
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
