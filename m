From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 11 Apr 2016 12:27:30 +0200
Subject: [Buildroot] [PATCH 5/5] python-urllib3: bump to version 1.15
In-Reply-To: <1460370450-22120-1-git-send-email-yegorslists@googlemail.com>
References: <1460370450-22120-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1460370450-22120-5-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-urllib3/python-urllib3.hash | 6 +++---
 package/python-urllib3/python-urllib3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 266b8e9..d7775fe 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5e1407428ac33b521c71a7ac273b3847, sha256 locally computed
-md5     5e1407428ac33b521c71a7ac273b3847  urllib3-1.14.tar.gz
-sha256  dd4fb13a4ce50b18338c7e4d665b21fd38632c5d4b1d9f1a1379276bd3c08d37  urllib3-1.14.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=19c136027dfae028f664b9e45ee55a92, sha256 locally computed
+md5     19c136027dfae028f664b9e45ee55a92  urllib3-1.15.tar.gz
+sha256  607c22f1b593e0e95c2eecb01138c58de9c574ec4c7a0e560c1e15031f941b3d  urllib3-1.15.tar.gz
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 0101053..17a15ba 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.14
+PYTHON_URLLIB3_VERSION = 1.15
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
 PYTHON_URLLIB3_SITE = https://pypi.python.org/packages/source/u/urllib3
 PYTHON_URLLIB3_LICENSE = MIT
-- 
2.1.4
