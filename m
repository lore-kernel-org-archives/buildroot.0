From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 11 Jan 2018 10:25:16 +0100
Subject: [Buildroot] [PATCH 1/5] python-setuptools: bump to version v38.4.0
Message-ID: <20180111092520.28438-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-setuptools/python-setuptools.hash | 3 ++-
 package/python-setuptools/python-setuptools.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index de6ad56d44..f116a69f74 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  99339ac1b4c9bc0a74745d6ff196a207ddfb5f7ca75df76f3d8d081a7f70cecc  python-setuptools-v36.0.1.tar.gz
+sha256  2599b4c452e77824bbd6da28d16b1fe8159c7a4c203d8d419d8b348fde7b9549  python-setuptools-v38.4.0.tar.gz
+sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 28d4f29b5b..004fc0db2a 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = v36.0.1
+PYTHON_SETUPTOOLS_VERSION = v38.4.0
 PYTHON_SETUPTOOLS_SITE = $(call github,pypa,setuptools,$(PYTHON_SETUPTOOLS_VERSION))
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
-- 
2.11.0
