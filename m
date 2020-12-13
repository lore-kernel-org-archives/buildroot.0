From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Dec 2020 18:15:30 +0100
Subject: [Buildroot] [PATCH] package/libolm: bump to version 3.2.1
In-Reply-To: <20201213171531.5182-1-gilles.talis@gmail.com>
References: <20201213171531.5182-1-gilles.talis@gmail.com>
Message-ID: <20201213171531.5182-2-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libolm/libolm.hash | 2 +-
 package/libolm/libolm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
index f521d30c0b..c080c7eaf3 100644
--- a/package/libolm/libolm.hash
+++ b/package/libolm/libolm.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  92ac1eccacbff620a1bc1a168ba204893d83bcb72646e456990ebe2480638696  olm-3.1.5.tar.gz
+sha256  d947d9570345e68696668cb855f1a6a7141b7b89cbcc15a08b1fae18535c4c45  olm-3.2.1.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
index 48cb31fb29..034b3449d9 100644
--- a/package/libolm/libolm.mk
+++ b/package/libolm/libolm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOLM_VERSION = 3.1.5
+LIBOLM_VERSION = 3.2.1
 LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
 LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
 LIBOLM_LICENSE = Apache-2.0
-- 
2.25.1
