From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 19:50:30 +0200
Subject: [Buildroot] [git commit] php: security bump to version 5.5.16
Message-ID: <20140825175037.CB8BD9D537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=374adc17a01c3617bdd09097e1226070566b22ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-3538 - Extensive backtracking in rule regular expression
CVE-2014-3587 - Segfault in cdf.c
CVE-2014-2497 - php-gd 'c_color' NULL pointer dereference
CVE-2014-5120 - Null byte injection possible with imagexxx functions
CVE-2014-3597 - segfault in dns_get_record

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index de7d668..d174533 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.5.15
+PHP_VERSION = 5.5.16
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
