From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 23:02:12 +0200
Subject: [Buildroot] [git commit] php-zmq: bump version to 1.1.3
Message-ID: <20160501210216.CC9C481E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f4a88209a4eecfda4935aa86a03a09276712417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php-zmq/php-zmq.hash | 2 +-
 package/php-zmq/php-zmq.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/php-zmq/php-zmq.hash b/package/php-zmq/php-zmq.hash
index 50ce639..c99e351 100644
--- a/package/php-zmq/php-zmq.hash
+++ b/package/php-zmq/php-zmq.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c9b0af56826fc5e1a95a0fef25e671d9839a421d79e174931faacd8bee389f31	zmq-1.1.2.tgz
+sha256 c492375818bd51b355352798fb94f04d6828c6aeda41ba813849624af74144ce  zmq-1.1.3.tgz
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
index 88c962d..2730996 100644
--- a/package/php-zmq/php-zmq.mk
+++ b/package/php-zmq/php-zmq.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-PHP_ZMQ_VERSION = 1.1.2
+PHP_ZMQ_VERSION = 1.1.3
 PHP_ZMQ_SOURCE = zmq-$(PHP_ZMQ_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_ZMQ_SITE = http://sources.buildroot.net
+PHP_ZMQ_SITE = https://pecl.php.net/get
 # phpize does the autoconf magic
 PHP_ZMQ_DEPENDENCIES = php zeromq host-autoconf host-pkgconf
 PHP_ZMQ_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
