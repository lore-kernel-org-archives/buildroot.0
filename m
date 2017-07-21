From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 21 Jul 2017 10:12:25 +0200
Subject: [Buildroot] [PATCH 2/7] python-urllib3: bump to version 1.21.1
In-Reply-To: <20170721081230.5584-1-yegorslists@googlemail.com>
References: <20170721081230.5584-1-yegorslists@googlemail.com>
Message-ID: <20170721081230.5584-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index f10d68e3d..226a82652 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/urllib3/json, sha256 locally computed
-md5 34691d4e7e20a8e9cdb452ea24fc38e7 urllib3-1.20.tar.gz
-sha256 97ef2b6e2878d84c0126b9f4e608e37a951ca7848e4855a7f7f4437d5c34a72f urllib3-1.20.tar.gz
+md5	ef6c72c79b9c6bcd68c204f9b92abc86  urllib3-1.21.1.tar.gz
+sha256	b14486978518ca0901a76ba973d7821047409d7f726f22156b24e83fd71382a5  urllib3-1.21.1.tar.gz
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 2dc28b19a..454f75fa1 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.20
+PYTHON_URLLIB3_VERSION = 1.21.1
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://pypi.python.org/packages/20/56/a6aa403b0998f857b474a538343ee483f5c02491bd1aebf61d42a3f60f77
+PYTHON_URLLIB3_SITE = https://pypi.python.org/packages/96/d9/40e4e515d3e17ed0adbbde1078e8518f8c4e3628496b56eb8f026a02b9e4
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
-- 
2.11.0
