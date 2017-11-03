From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  3 Nov 2017 15:49:38 +0100
Subject: [Buildroot] [PATCH 2/2] python-mistune: bump version to 0.8
In-Reply-To: <20171103144938.17147-1-yegorslists@googlemail.com>
References: <20171103144938.17147-1-yegorslists@googlemail.com>
Message-ID: <20171103144938.17147-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence file checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-mistune/python-mistune.hash | 5 +++--
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index cfc6a25e2c..e939aefc86 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/mistune/json, sha256 locally computed
-md5	4eba50bd121b83716fa4be6a4049004b  mistune-0.7.3.tar.gz
-sha256	21d0e869df3b9189f248e022f1c9763cf9069e1a2f00676f1f1852bd7f98b713  mistune-0.7.3.tar.gz
+md5	8bd955fe74ce37af54b16c0d9b89a2ef  mistune-0.8.tar.gz
+sha256	dc3f43e7cf0abb95cdfecbf82d85c419108d5f13e1844b2a8a2fc0abf24c7a47  mistune-0.8.tar.gz
+sha256  0c5259c3dd0a7c46f4835221645f62a0638c9b9faa02af08676e8069e1ff964b  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index 4141729da8..405216ccb4 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 0.7.3
+PYTHON_MISTUNE_VERSION = 0.8
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://pypi.python.org/packages/88/1e/be99791262b3a794332fda598a07c2749a433b9378586361ba9d8e824607
+PYTHON_MISTUNE_SITE = https://pypi.python.org/packages/d3/66/a45d1c7c50fd63a707cd1bd340b969523137c5284d9466c41012fe54c621
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
-- 
2.11.0
