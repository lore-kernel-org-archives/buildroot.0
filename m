From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 May 2017 13:45:15 +0100
Subject: [Buildroot] [PATCH next 2/8] php-amqp: bump version to 1.9.0
In-Reply-To: <20170512124521.4619-1-Vincent.Riera@imgtec.com>
References: <20170512124521.4619-1-Vincent.Riera@imgtec.com>
Message-ID: <20170512124521.4619-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.10.2
