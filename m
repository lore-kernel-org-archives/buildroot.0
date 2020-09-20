From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2020 10:30:16 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-aiozipkin: bump to version
 0.7.1
Message-ID: <20200920163016.1275750-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiozipkin/python-aiozipkin.hash | 6 +++---
 package/python-aiozipkin/python-aiozipkin.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiozipkin/python-aiozipkin.hash b/package/python-aiozipkin/python-aiozipkin.hash
index 8034381751..af07285c23 100644
--- a/package/python-aiozipkin/python-aiozipkin.hash
+++ b/package/python-aiozipkin/python-aiozipkin.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiozipkin/json
-md5	01766aa607ae121d2cbb3ebf15a8cd0b  aiozipkin-0.6.0.tar.gz
-sha256	7270cdaff81f4a6ea70de48b3e4597629c3beef76740bfe6f7c9b58b45b67c73  aiozipkin-0.6.0.tar.gz
+md5  7be9acaa48d4d4dc14abcc79edfd6c16  aiozipkin-0.7.1.tar.gz
+sha256  aa99984832225378d900a5cd0d4e8e89af7ec9f359612c2e311f55b9039ed501  aiozipkin-0.7.1.tar.gz
 # Locally computed sha256 checksums
-sha256	9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
+sha256  9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
diff --git a/package/python-aiozipkin/python-aiozipkin.mk b/package/python-aiozipkin/python-aiozipkin.mk
index 2f5b54be6c..e351dbacfe 100644
--- a/package/python-aiozipkin/python-aiozipkin.mk
+++ b/package/python-aiozipkin/python-aiozipkin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOZIPKIN_VERSION = 0.6.0
+PYTHON_AIOZIPKIN_VERSION = 0.7.1
 PYTHON_AIOZIPKIN_SOURCE = aiozipkin-$(PYTHON_AIOZIPKIN_VERSION).tar.gz
-PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/8d/14/33c79497c3082dd93172f834e4f3d1d6d0eb9b957b6885c919ca73462ed6
+PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/9e/33/120925f90470b7f52f46e2b9f71caf2514e389f42b3ed3b62f6389baee95
 PYTHON_AIOZIPKIN_SETUP_TYPE = setuptools
 PYTHON_AIOZIPKIN_LICENSE = Apache-2.0
 PYTHON_AIOZIPKIN_LICENSE_FILES = LICENSE
-- 
2.25.1
