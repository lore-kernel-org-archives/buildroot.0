From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:02 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-logbook: bump to version
 1.5.3
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-5-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-logbook/python-logbook.hash | 4 ++--
 package/python-logbook/python-logbook.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index 774aaf594d..7cbcf6caf0 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/logbook/json
-md5	9fdaa126c21be04d936834abb0cb499d  Logbook-1.5.2.tar.gz
-sha256	1aeb299401d9fe228f204d83073f0ec240e3ae0d50295bf8e5be91a9cd8b7a57  Logbook-1.5.2.tar.gz
+md5	719970ea22dd274797bb4328161d700f  Logbook-1.5.3.tar.gz
+sha256	66f454ada0f56eae43066f604a222b09893f98c1adc18df169710761b8f32fe8  Logbook-1.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256	2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index e637236679..8f02e9b945 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.5.2
+PYTHON_LOGBOOK_VERSION = 1.5.3
 PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/6b/3f/f4e6693791efacc1282852fba5392da0649b19416b37422c5489f79a52ea
+PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/2f/d9/16ac346f7c0102835814cc9e5b684aaadea101560bb932a2403bd26b2320
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
-- 
2.20.1
