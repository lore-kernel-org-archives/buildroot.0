From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Mar 2016 09:31:22 -0300
Subject: [Buildroot] [PATCH] python-cryptography: bump to version 1.2.3
Message-ID: <1457008282-2979-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is now compatible with openssl 1.0.2g+ hence fixes:
http://autobuild.buildroot.net/results/5fc/5fc28bafa3cd7171ce6343d21f65af090536f443/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-cryptography/python-cryptography.hash | 7 ++++---
 package/python-cryptography/python-cryptography.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index b35f801..e48e2e2 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,3 +1,4 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2b25eebd1d3c6bae52b46f0dcec74dfb, sha256 locally computed
-md5     2b25eebd1d3c6bae52b46f0dcec74dfb  cryptography-1.2.2.tar.gz
-sha256  3f219cb9106d9b737ea9c332c4d15d70ac328f91b59fd9d79f78bdea8f826a67  cryptography-1.2.2.tar.gz
+# From https://pypi.python.org/pypi?:action=show_md5&digest=5474d2b3e8c7555a60852e48d2743f85
+md5     5474d2b3e8c7555a60852e48d2743f85  cryptography-1.2.3.tar.gz
+# Calculated based on the hash above
+sha256  8eb11c77dd8e73f48df6b2f7a7e16173fe0fe8fdfe266232832e88477e08454e  cryptography-1.2.3.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index cefd3cb..1f91422 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 1.2.2
+PYTHON_CRYPTOGRAPHY_VERSION = 1.2.3
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/source/c/cryptography
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
-- 
2.4.10
