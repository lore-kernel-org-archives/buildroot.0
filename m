From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Date: Fri, 14 Jul 2017 12:38:00 +0700
Subject: [Buildroot] [PATCH 3/3] package/python-alsaaudio: bump version to
	0.8.4
In-Reply-To: <20170714053800.20007-1-alexey.roslyakov@gmail.com>
References: <20170714053800.20007-1-alexey.roslyakov@gmail.com>
Message-ID: <20170714053800.20007-3-alexey.roslyakov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
---
 package/python-alsaaudio/python-alsaaudio.hash | 6 +++---
 package/python-alsaaudio/python-alsaaudio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
index 92277ec393..79cb775e4c 100644
--- a/package/python-alsaaudio/python-alsaaudio.hash
+++ b/package/python-alsaaudio/python-alsaaudio.hash
@@ -1,4 +1,4 @@
-# From https://pypi.python.org/pypi?:action=show_md5&digest=1f22415a3d8da4b303182ad81c2d062e
-md5	1f22415a3d8da4b303182ad81c2d062e	pyalsaaudio-0.8.2.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b46f69561bc85fc52e698b2440ca251e, sha256 locally computed
+md5	b46f69561bc85fc52e698b2440ca251e	pyalsaaudio-0.8.4.tar.gz
 # Locally calculated
-sha256	b6df486f1c4035041a5f3800496b86c64e48e4a7d47f94dcbca11b0187aa3a15	pyalsaaudio-0.8.2.tar.gz
+sha256	84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085	pyalsaaudio-0.8.4.tar.gz
diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
index 73a7e74b03..caa53e562e 100644
--- a/package/python-alsaaudio/python-alsaaudio.mk
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALSAAUDIO_VERSION = 0.8.2
+PYTHON_ALSAAUDIO_VERSION = 0.8.4
 PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
-PYTHON_ALSAAUDIO_SITE = https://pypi.python.org/packages/source/p/pyalsaaudio
+PYTHON_ALSAAUDIO_SITE = https://pypi.python.org/packages/52/b6/44871791929d9d7e11325af0b7be711388dfeeab17147988f044a41a6d83
 PYTHON_ALSAAUDIO_SETUP_TYPE = distutils
 PYTHON_ALSAAUDIO_LICENSE = Python-2.0
 PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
-- 
2.13.0
