From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Sep 2018 23:46:54 +0200
Subject: [Buildroot] [PATCH 1/1] i2pd: bump to version 2.20
Message-ID: <20180910214654.9157-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/i2pd/i2pd.hash | 2 +-
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 753df0be5a..451ee006a4 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	7202497ffc3db632d0f7fed93eafaf39aa75efea199705dae7d022249b069eb9	i2pd-2.19.0.tar.gz
+sha256	e424c368f92be5050f3dd5e98ed9ce2ea8d6076e36444c99b96e3b10f69420b1	i2pd-2.20.0.tar.gz
 sha256	d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c	LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index b7ebd718a5..8447f3e06b 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.19.0
+I2PD_VERSION = 2.20.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
-- 
2.17.1
