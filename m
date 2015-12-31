From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 31 Dec 2015 09:52:45 +0100
Subject: [Buildroot] [PATCH] python-twisted: bump to 15.5.0
Message-ID: <1451551965-2492-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-twisted/python-twisted.hash | 2 +-
 package/python-twisted/python-twisted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 937cab3..9a9436f 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  038096be8723b678e2ead323b14d0d3e2db161e0c7ce3c98fdd18ca5869acb71  Twisted-14.0.2.tar.bz2
+sha256  a8046804a0dfae090234bbb90fc560a6cc11a208b3d048b55244c79c1945c17f  Twisted-15.5.0.tar.bz2
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index a2e2486..29fd510 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 14.0.2
+PYTHON_TWISTED_VERSION = 15.5.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
 PYTHON_TWISTED_SITE = https://pypi.python.org/packages/source/T/Twisted
 PYTHON_TWISTED_SETUP_TYPE = setuptools
-- 
2.1.4
