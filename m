From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 20 Dec 2016 15:28:51 +0100
Subject: [Buildroot] [PATCH 1/2] python-cryptography: bump to version 1.7.1
Message-ID: <1482244132-9835-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cryptography/python-cryptography.hash | 4 ++--
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 60fe3eb..7738d23 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/cryptography/json, sha256 locally computed
-md5	f977a6ddb38b071213c0157fc77c62ab  cryptography-1.5.2.tar.gz
-sha256	eb8875736734e8e870b09be43b17f40472dc189b1c422a952fa8580768204832  cryptography-1.5.2.tar.gz
+md5	2f63dee6ace602d1d20d1995f8538015  cryptography-1.7.1.tar.gz
+sha256	953fef7d40a49a795f4d955c5ce4338abcec5dea822ed0414ed30348303fdb4c  cryptography-1.7.1.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 75e6bb3..d4e18ec 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 1.5.2
+PYTHON_CRYPTOGRAPHY_VERSION = 1.7.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/03/1a/60984cb85cc38c4ebdfca27b32a6df6f1914959d8790f5a349608c78be61
+PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/82/f7/d6dfd7595910a20a563a83a762bf79a253c4df71759c3b228accb3d7e5e4
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3c
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.1.4
