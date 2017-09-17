From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:27:36 +0200
Subject: [Buildroot] [git commit] package/php-ssh2: bump version to 1.1.2
Message-ID: <20170917162022.89D5D7FBE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5634865be2a9db175023f7aec95f594b1130b294
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php-ssh2/php-ssh2.hash | 2 +-
 package/php-ssh2/php-ssh2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-ssh2/php-ssh2.hash b/package/php-ssh2/php-ssh2.hash
index 2529f9a..f110e77 100644
--- a/package/php-ssh2/php-ssh2.hash
+++ b/package/php-ssh2/php-ssh2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6a93891878b23904a773eb814fec7aea4ea00b4a412ee779c8535ed9c5e46ced  ssh2-1.0.tgz
+sha256 87618d6a0981afe8c24b36d6b38c21a0aa0237b62e60347d0170bd86b51f79fb  ssh2-1.1.2.tgz
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index d7ac2b4..c9c1301 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_SSH2_VERSION = 1.0
+PHP_SSH2_VERSION = 1.1.2
 PHP_SSH2_SOURCE = ssh2-$(PHP_SSH2_VERSION).tgz
 PHP_SSH2_SITE = https://pecl.php.net/get
 PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
