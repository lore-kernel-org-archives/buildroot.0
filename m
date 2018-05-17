From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Date: Thu, 17 May 2018 22:02:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuio: bump to 0.2.8
Message-ID: <20180517200250.157586-1-martijn.de.gouw@prodrive-technologies.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After years of inactivity, several bugfixes and features are merged

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
---
 package/libuio/libuio.hash | 2 +-
 package/libuio/libuio.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libuio/libuio.hash b/package/libuio/libuio.hash
index 6afe7dea8b..ce2f86ee19 100644
--- a/package/libuio/libuio.hash
+++ b/package/libuio/libuio.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 57f9617f75d20f7912b270568cffdf098fe9d0c1ca690c002e949be8424aa4e6 libuio-940861de278cb794bf9d775b76a4d1d4f9108607.tar.gz
+sha256 1494375bd493ef1a1b868ce2cbc7d29f3f9f692c21f70689eae28566e56f2c15 libuio-ca28ff0f69d89a789a47552c72db5a43d280710b.tar.gz
diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index 8f72253add..13429ec0f1 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# v0.2.7
-LIBUIO_VERSION = 940861de278cb794bf9d775b76a4d1d4f9108607
+# v0.2.8
+LIBUIO_VERSION = ca28ff0f69d89a789a47552c72db5a43d280710b
 LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
 LIBUIO_LICENSE = LGPL-2.1 (library), GPL-2.0 (programs)
 LIBUIO_LICENSE_FILES = COPYING
-- 
2.11.0
