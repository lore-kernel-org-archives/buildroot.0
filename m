From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 22 Jan 2021 23:15:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-fire: bump to version 0.4.0
Message-ID: <20210122211522.2603694-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-fire/python-fire.hash | 4 ++--
 package/python-fire/python-fire.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
index a6a2df8c00..d86376c52b 100644
--- a/package/python-fire/python-fire.hash
+++ b/package/python-fire/python-fire.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fire/json
-md5  af6da611394a2332fbd5bd9f1227254e  fire-0.3.1.tar.gz
-sha256  9736a16227c3d469e5d2d296bce5b4d8fa8d7851e953bda327a455fc2994307f  fire-0.3.1.tar.gz
+md5  799be84cbbd7df2cf159cdcb538ab6f9  fire-0.4.0.tar.gz
+sha256  c5e2b8763699d1142393a46d0e3e790c5eb2f0706082df8f647878842c216a62  fire-0.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index f6a2e073f0..7ba971abc4 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FIRE_VERSION = 0.3.1
+PYTHON_FIRE_VERSION = 0.4.0
 PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
-PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/34/a7/0e22e70778aca01a52b9c899d9c145c6396d7b613719cd63db97ffa13f2f
+PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/11/07/a119a1aa04d37bc819940d95ed7e135a7dcca1c098123a3764a6dcace9e7
 PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
-- 
2.27.0
