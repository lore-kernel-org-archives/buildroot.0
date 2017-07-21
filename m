From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 23:04:45 +0200
Subject: [Buildroot] [git commit] python-hyperlink: bump to version 17.3.0
Message-ID: <20170721210346.7FDFB82148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1708fa00f071168627eed0cc7c791528ecb0435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-hyperlink/python-hyperlink.hash | 4 ++--
 package/python-hyperlink/python-hyperlink.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-hyperlink/python-hyperlink.hash b/package/python-hyperlink/python-hyperlink.hash
index 5ff5e7a..565a34d 100644
--- a/package/python-hyperlink/python-hyperlink.hash
+++ b/package/python-hyperlink/python-hyperlink.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/hyperlink/json, sha256 locally computed
-md5	717dae425baa7b6f6d9d590666ec8472  hyperlink-17.2.1.tar.gz
-sha256	2c74b35662416f44823d50e59305f761a933723ae6528cc5b0d711361453f28b  hyperlink-17.2.1.tar.gz
+md5	7a86b09d80b8f0c89f6b61efa0ebaab9  hyperlink-17.3.0.tar.gz
+sha256	ddadbbdda2b94182da14be1b5d26ec3188dfdf9687b9b8c8d810f52f79b7af1a  hyperlink-17.3.0.tar.gz
diff --git a/package/python-hyperlink/python-hyperlink.mk b/package/python-hyperlink/python-hyperlink.mk
index 21f784e..7b48e36 100644
--- a/package/python-hyperlink/python-hyperlink.mk
+++ b/package/python-hyperlink/python-hyperlink.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_HYPERLINK_VERSION = 17.2.1
+PYTHON_HYPERLINK_VERSION = 17.3.0
 PYTHON_HYPERLINK_SOURCE = hyperlink-$(PYTHON_HYPERLINK_VERSION).tar.gz
-PYTHON_HYPERLINK_SITE = https://pypi.python.org/packages/a2/d9/56b6a007a643d6511e616a2be74f67c3703e2aea4e9eaa44bdf48bc78c82
+PYTHON_HYPERLINK_SITE = https://pypi.python.org/packages/61/9c/69aa5d6942271961ad1fff910db77706623423d054ecb647da963efdf49a
 PYTHON_HYPERLINK_SETUP_TYPE = setuptools
 PYTHON_HYPERLINK_LICENSE = MIT
+PYTHON_HYPERLINK_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
