From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 24 Mar 2015 20:50:49 +0100
Subject: [Buildroot] [PATCH 1/2] python-tornado: bump to 4.1
Message-ID: <1427226650-3208-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-tornado/python-tornado.hash | 2 +-
 package/python-tornado/python-tornado.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index f5234d5..72748ab 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  900c5124ebdb6598ca8e8a0c5888f41a5f14117952d5515258e3d20222b21bfa  tornado-4.0.2.tar.gz
+sha256  99abd3aede45c93739346ee7384e710120121c3744da155d5cff1c0101702228  tornado-4.1.tar.gz
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 5b88dd6..2300579 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 4.0.2
+PYTHON_TORNADO_VERSION = 4.1
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
 PYTHON_TORNADO_SITE = https://pypi.python.org/packages/source/t/tornado
 PYTHON_TORNADO_LICENSE = Apache-2.0
-- 
2.1.0
