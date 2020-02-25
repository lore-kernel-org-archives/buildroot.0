From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 25 Feb 2020 23:41:29 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/i2pd: bump to version 2.30.0
Message-ID: <20200225224129.1805647-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/i2pd/i2pd.hash | 4 ++--
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 0ae6ea05fb..26d3be6914 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	fd0474c33b411593b9dc8197f3799d37d68455c11a9ee3994ec993a96388ec06	i2pd-2.29.0.tar.gz
-sha256	d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c	LICENSE
+sha256  25915cbd33a9f53c89ddf7fbd68fccc5ffc89ab40d4445ccc813da74fae154f2  i2pd-2.30.0.tar.gz
+sha256  d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index c031145472..56af5cb44b 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.29.0
+I2PD_VERSION = 2.30.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
-- 
2.25.0
