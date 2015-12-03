From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  3 Dec 2015 10:19:52 +0100
Subject: [Buildroot] [PATCH] python-lxml: bump to 3.5.0
Message-ID: <1449134392-564-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 624d8b0..08402ed 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b3d362bac471172747cda3513238f115cbd6c5f8b8e6319bf6a97a7892724099  lxml-3.4.4.tgz
+sha256  349f93e3a4b09cc59418854ab8013d027d246757c51744bf20069bc89016f578  lxml-3.5.0.tgz
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 321e56d..8bfbb3b 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 3.4.4
+PYTHON_LXML_VERSION = 3.5.0
 PYTHON_LXML_SITE = http://lxml.de/files
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
 
-- 
2.1.4
