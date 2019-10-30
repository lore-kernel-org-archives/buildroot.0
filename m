From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:39:16 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/php: security
 bump version to 7.3.11
Message-ID: <20191030123254.3B2168E0B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e23d1b36a750b550c7f2ba7f601355267e766098
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Changelog: http://www.php.net/ChangeLog-7.php#7.3.11

Fixes CVE-2019-11043: https://bugs.php.net/bug.php?id=78599

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 335edd0269afc3186857d6b457c517c47ff644c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 2afcb2cd77..debc14c64e 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 42f00a15419e05771734b7159c8d39d639b8a5a6770413adfa2615f6f923d906  php-7.3.10.tar.xz
+sha256 657cf6464bac28e9490c59c07a2cf7bb76c200f09cfadf6e44ea64e95fa01021  php-7.3.11.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index bfb5923191..0213295c82 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.10
+PHP_VERSION = 7.3.11
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
