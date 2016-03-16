From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 16 Mar 2016 16:41:47 +0100
Subject: [Buildroot] [PATCH 2/4] python-pyroute2: bump to version 0.3.16
In-Reply-To: <1458142909-26392-1-git-send-email-yegorslists@googlemail.com>
References: <1458142909-26392-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1458142909-26392-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pyroute2/python-pyroute2.hash | 6 +++---
 package/python-pyroute2/python-pyroute2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index 9784927..69b87c7 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=09cf70377ddf45ffc27b4ad56bcdf52e, sha256 locally computed
-md5     09cf70377ddf45ffc27b4ad56bcdf52e  pyroute2-0.3.15.tar.gz
-sha256  f5b7116fd97f73f97adc3b9c040a4ddbe61f18bb02f47e1c8399567c8791d270  pyroute2-0.3.15.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=1c780304d18461611fe9ffaf7582bd82, sha256 locally computed
+md5     1c780304d18461611fe9ffaf7582bd82  pyroute2-0.3.16.tar.gz
+sha256  670fe054d2f262e0d679b3bb25094e0a508b67a8c5df5d45be9d1482d191b7b5  pyroute2-0.3.16.tar.gz
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index fffd556..7317979 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PYTHON_PYROUTE2_VERSION = 0.3.15
+PYTHON_PYROUTE2_VERSION = 0.3.16
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
 PYTHON_PYROUTE2_SITE = https://pypi.python.org/packages/source/p/pyroute2
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPLv2+
-- 
2.7.0
