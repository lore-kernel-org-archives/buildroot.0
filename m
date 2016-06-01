From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 17:08:48 +0200
Subject: [Buildroot] [git commit branch/next] php: security bump version to
	7.0.7
Message-ID: <20160601150852.733D481ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9a0903cfeec867b80bd646903af3f149eeefc4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes CVE-2013-7456 https://bugs.php.net/bug.php?id=72227
Fixes CVE-2016-5093 https://bugs.php.net/bug.php?id=72241

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 4bc0263..ace5281 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 1b237a9455e5476a425dbb9d99966bad68107747c601958cb9558a7fb49ab419  php-7.0.6.tar.xz
+sha256 9cc64a7459242c79c10e79d74feaf5bae3541f604966ceb600c3d2e8f5fe4794  php-7.0.7.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index fbdb738..2997b1b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.0.6
+PHP_VERSION = 7.0.7
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
