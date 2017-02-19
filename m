From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:12 -0500
Subject: [Buildroot] [PATCH 15/58] python-flup: bump to version
	1.0.3.dev20161029
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-16-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-flup/python-flup.hash | 7 +++----
 package/python-flup/python-flup.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-flup/python-flup.hash b/package/python-flup/python-flup.hash
index 50a0381..86f8d1b 100644
--- a/package/python-flup/python-flup.hash
+++ b/package/python-flup/python-flup.hash
@@ -1,4 +1,3 @@
-# From https://pypi.python.org/pypi/flup/1.0.3.dev-20110405
-md5	a005b072d144fc0e44b0fa4c5a9ba029	flup-1.0.3.dev-20110405.tar.gz
-# Calculated based on the hash above
-sha256	6649cf41854ea8782c795cdde64fdf79a90db821533d3652f91d21b0a7f39c79	flup-1.0.3.dev-20110405.tar.gz
+# md5 from https://pypi.python.org/pypi/flup/json, sha256 locally computed
+md5 bc104a7444bfac36fc2146a356de4c11 flup-1.0.3.dev20161029.tar.gz
+sha256 3dc5620b77a6a4cd0afb556626eb0ce85708e513f9c50dc5e982190e3d5f9e26 flup-1.0.3.dev20161029.tar.gz
diff --git a/package/python-flup/python-flup.mk b/package/python-flup/python-flup.mk
index 5e612bb..edcff2a 100644
--- a/package/python-flup/python-flup.mk
+++ b/package/python-flup/python-flup.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLUP_VERSION = 1.0.3.dev-20110405
+PYTHON_FLUP_VERSION = 1.0.3.dev20161029
 PYTHON_FLUP_SOURCE = flup-$(PYTHON_FLUP_VERSION).tar.gz
-PYTHON_FLUP_SITE = http://pypi.python.org/packages/source/f/flup
+PYTHON_FLUP_SITE = https://pypi.python.org/packages/17/33/36768930a5ffe4f294ed3987c631bfd3fddb4f9e5e46bc8dc30fd731dbcd
 
 PYTHON_FLUP_LICENSE = BSD-2c, MIT
 
-- 
2.9.3
