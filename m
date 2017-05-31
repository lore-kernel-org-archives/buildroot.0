From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 23:34:28 +0200
Subject: [Buildroot] [git commit branch/next] php-amqp: bump version to 1.9.0
Message-ID: <20170531213548.AD2F082957@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa33d401ff818be4e27a2b86bce30a07a0d62416
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php-amqp/php-amqp.hash | 2 +-
 package/php-amqp/php-amqp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-amqp/php-amqp.hash b/package/php-amqp/php-amqp.hash
index 73c69d9..4b3b197 100644
--- a/package/php-amqp/php-amqp.hash
+++ b/package/php-amqp/php-amqp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 38a92eaef1aa863404170bcd15605f7f78140eeec1ff5be6af65c5b8081e2599  amqp-1.7.1.tgz
+sha256 f45831d498b8fa47a151c31f6abdc0530aa6eabda6e2e10514aca3bdc76a5098  amqp-1.9.0.tgz
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index fe49f4b..a2815d6 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_AMQP_VERSION = 1.7.1
+PHP_AMQP_VERSION = 1.9.0
 PHP_AMQP_SOURCE = amqp-$(PHP_AMQP_VERSION).tgz
 PHP_AMQP_SITE = https://pecl.php.net/get
 PHP_AMQP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
