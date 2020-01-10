From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 10 Jan 2020 08:26:43 -0800
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.8.1
Message-ID: <20200110162643.35865-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index de317e897d..3773825b43 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
 # From https://www.python.org/downloads/release/python-380/
-md5		dbac8df9d8b9edc678d0f4cacdb7dbb0 Python-3.8.0.tar.xz
+md5		b3fb85fd479c0bf950c626ef80cacb57 Python-3.8.1.tar.xz
 # Locally computed
-sha256 b356244e13fb5491da890b35b13b2118c3122977c2cd825e3eb6e7d462030d84 Python-3.8.0.tar.xz
+sha256 75894117f6db7051c1b34f37410168844bbb357c139a8a10a352e9bf8be594e8 Python-3.8.1.tar.xz
 sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a6692c5257..9432f1c59e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.8
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.21.0 (Apple Git-122.2)
