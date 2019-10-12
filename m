From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 12 Oct 2019 11:47:37 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-ecdsa: bump to version 0.13.3
Message-ID: <20191012084739.19673-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ecdsa/python-ecdsa.hash | 4 ++--
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index 62296de8cc..3e24783657 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5	0ce51d17c0751e5232be4eafd69b7f13  ecdsa-0.13.2.tar.gz
-sha256	5c034ffa23413ac923541ceb3ac14ec15a0d2530690413bff58c12b80e56d884  ecdsa-0.13.2.tar.gz
+md5	b1b33f7fe171eb1278de6f93eefc34f8  ecdsa-0.13.3.tar.gz
+sha256	163c80b064a763ea733870feb96f9dd9b92216cfcacd374837af18e4e8ec3d4d  ecdsa-0.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256	3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index 3325f2b152..90e359f8b7 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.13.2
+PYTHON_ECDSA_VERSION = 0.13.3
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/51/76/139bf6e9b7b6684d5891212cdbd9e0739f2bfc03f380a1a6ffa700f392ac
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/8c/d8/9c3596fd0f18ae0a76333492a119c00183323d8e64de1a4f4bd642856963
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
-- 
2.20.1
