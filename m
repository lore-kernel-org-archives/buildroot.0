From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jul 2016 13:55:57 +0200
Subject: [Buildroot] [git commit] php: bump version to 7.0.9
Message-ID: <20160721115651.B9EE67FCF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac43e455fe37a872398fc6552d39aed3cd84009e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index f3718f1..6e146f8 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 0a2142c458b0846f556b16da1c927d74c101aa951bb840549abe5c58584fb394  php-7.0.8.tar.xz
+sha256 970c322ba3e472cb0264b8ba9d4d92e87918da5d0cca53c4aba2a70545b8626d  php-7.0.9.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index f5cb224..d7e27a1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.0.8
+PHP_VERSION = 7.0.9
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
