From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jul 2020 09:02:30 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/php: bump version
 to 7.4.7
Message-ID: <20200713065942.1B6E68131A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1a667abdb9de19b31c4badf7aca700d34d5ebcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Changelog: https://www.php.net/ChangeLog-7.php#7.4.7

Contrary to the release notification on the mailinglist
https://news-web.php.net/php.announce/287
which declares this release as "security bug fix release" no CVE IDs
could be found on the bugtracker entries mentioned in the Changelog.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 759ed1039552bf79275bf000b89227a7f2cc8040)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0267375f6e..9789a99988 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  d740322f84f63019622b9f369d64ea5ab676547d2bdcf12be77a5a4cffd06832  php-7.4.6.tar.xz
+sha256  53558f8f24cd8ab6fa0ea252ca8198e2650160649681ce5230c1df1dc2b52faf  php-7.4.7.tar.xz
 
 # License file
 sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 73be57a8a1..ed71404c7b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.6
+PHP_VERSION = 7.4.7
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
