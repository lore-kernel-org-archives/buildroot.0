From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-flup: bump to version
	1.0.3.dev20161029
Message-ID: <20170302205923.56E3A82298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff0f53c04db8cc6eb5ce2eb92b7e7d1fe17297ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
