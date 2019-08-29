From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:17:13 +0200
Subject: [Buildroot] [git commit branch/next] package/python-daemonize: bump
 to version 2.5.0
Message-ID: <20190829202159.8E3148839C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3153d12ae3ce68c97955f58611e60c6397f18613
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-daemonize/python-daemonize.hash | 8 +++++---
 package/python-daemonize/python-daemonize.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-daemonize/python-daemonize.hash b/package/python-daemonize/python-daemonize.hash
index d2111a3193..aa2c904523 100644
--- a/package/python-daemonize/python-daemonize.hash
+++ b/package/python-daemonize/python-daemonize.hash
@@ -1,3 +1,5 @@
-# From https://pypi.python.org/pypi/daemonize/json
-md5    6759005b12dfeea0d4305f8536b4b0c2  daemonize-2.4.7.tar.gz
-sha256 c0194e861826be456c7c69985825ac7b79632d8ac7ad4cde8e12fee7971468c8  daemonize-2.4.7.tar.gz
+# md5, sha256 from https://pypi.org/pypi/daemonize/json
+md5	3d64e7a0219ad22e3fca62460f893b6a  daemonize-2.5.0.tar.gz
+sha256	dd026e4ff8d22cb016ed2130bc738b7d4b1da597ef93c074d2adb9e4dea08bc3  daemonize-2.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256	248d0d3147d20a09bed8f03da8ed72f47009073606dcc1bab658f942d34b29f8  LICENSE
diff --git a/package/python-daemonize/python-daemonize.mk b/package/python-daemonize/python-daemonize.mk
index bfcfe93378..de146bf8de 100644
--- a/package/python-daemonize/python-daemonize.mk
+++ b/package/python-daemonize/python-daemonize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DAEMONIZE_VERSION = 2.4.7
+PYTHON_DAEMONIZE_VERSION = 2.5.0
 PYTHON_DAEMONIZE_SOURCE = daemonize-$(PYTHON_DAEMONIZE_VERSION).tar.gz
-PYTHON_DAEMONIZE_SITE = https://pypi.python.org/packages/84/15/923e3fe48239adf5d697c29e04a3f868d3e4ce8539aab29d6abe784db5be
+PYTHON_DAEMONIZE_SITE = https://files.pythonhosted.org/packages/8c/20/96f7dbc23812cfe4cf479c87af3e4305d0d115fd1fffec32ddeee7b9c82b
 PYTHON_DAEMONIZE_SETUP_TYPE = setuptools
 PYTHON_DAEMONIZE_LICENSE = MIT
 PYTHON_DAEMONIZE_LICENSE_FILES = LICENSE
