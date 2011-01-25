From: Maxime Ripard <ripard@archos.com>
Date: Tue, 25 Jan 2011 22:07:14 +0100
Subject: [Buildroot] [git commit master 1/1] python: Move to version 2.7
Message-ID: <20110125211619.B19808D245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=afe54f1008dee29af6338d8766381aad9e2871bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <ripard@archos.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 8721d40..5c85c59 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -3,8 +3,8 @@
 # python
 #
 #############################################################
-PYTHON_VERSION=2.4.5
-PYTHON_VERSION_MAJOR=2.4
+PYTHON_VERSION=2.7
+PYTHON_VERSION_MAJOR=2.7
 PYTHON_SOURCE:=Python-$(PYTHON_VERSION).tar.bz2
 PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_DIR:=$(BUILD_DIR)/Python-$(PYTHON_VERSION)
-- 
1.7.3.4
