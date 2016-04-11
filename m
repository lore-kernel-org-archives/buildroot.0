From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 11 Apr 2016 12:27:26 +0200
Subject: [Buildroot] [PATCH 1/5] python-lxml: bump to version 3.6.0
Message-ID: <1460370450-22120-1-git-send-email-yegorslists@googlemail.com>
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
index 08402ed..4cace8e 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  349f93e3a4b09cc59418854ab8013d027d246757c51744bf20069bc89016f578  lxml-3.5.0.tgz
+sha256  9c74ca28a7f0c30dca8872281b3c47705e21217c8bc63912d95c9e2a7cac6bdf  lxml-3.6.0.tgz
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 8bfbb3b..039fadd 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 3.5.0
+PYTHON_LXML_VERSION = 3.6.0
 PYTHON_LXML_SITE = http://lxml.de/files
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
 
-- 
2.1.4
