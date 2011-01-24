From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 12:01:29 +0100
Subject: [Buildroot] [PATCH 01/10] python: Move to version 2.7
In-Reply-To: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e2e6fc47574b270dc4a332f6257a7d4784b8318f.1295866866.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <ripard@archos.com>

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
1.7.0.4
