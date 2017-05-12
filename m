From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 May 2017 13:45:14 +0100
Subject: [Buildroot] [PATCH next 1/8] php: bump version to 7.1.5
Message-ID: <20170512124521.4619-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 35c5925..d34242f 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 71514386adf3e963df087c2044a0b3747900b8b1fc8da3a99f0a0ae9180d300b  php-7.1.4.tar.xz
+sha256 d149a3c396c45611f5dc6bf14be190f464897145a76a8e5851cf18ff7094f6ac  php-7.1.5.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 46f57e4..cfc6789 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.4
+PHP_VERSION = 7.1.5
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.10.2
