From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 16:01:09 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] package/php: bump version
	to 7.1.6
Message-ID: <20170719204758.B9EE080175@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d51d7742b561a21bf5f45596e4f24bfc9b5cea19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0b5d531e6d6c79d4165d4f8f2d1e1d848bfcf7a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index d34242f..0c8518b 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 d149a3c396c45611f5dc6bf14be190f464897145a76a8e5851cf18ff7094f6ac  php-7.1.5.tar.xz
+sha256 01584dc521ab7ec84b502b61952f573652fe6aa00c18d6d844fb9209f14b245b  php-7.1.6.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index cfc6789..ed12dd3 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.5
+PHP_VERSION = 7.1.6
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
