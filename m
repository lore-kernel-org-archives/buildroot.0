From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:50:31 +0200
Subject: [Buildroot] [git commit] package/python-hyperlink: bump to version
 19.0.0
Message-ID: <20191005204553.6CF7788F54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13ce0d229aee1d9d3b2e9f47744d2259e8d38499
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hyperlink/python-hyperlink.hash | 4 ++--
 package/python-hyperlink/python-hyperlink.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hyperlink/python-hyperlink.hash b/package/python-hyperlink/python-hyperlink.hash
index fcf0cc9219..94535002e6 100644
--- a/package/python-hyperlink/python-hyperlink.hash
+++ b/package/python-hyperlink/python-hyperlink.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hyperlink/json
-md5	f41a96779b324d824864696a94b24823  hyperlink-18.0.0.tar.gz
-sha256	f01b4ff744f14bc5d0a22a6b9f1525ab7d6312cb0ff967f59414bbac52f0a306  hyperlink-18.0.0.tar.gz
+md5	4772fb4d87c26a1ab22a6161424e3cba  hyperlink-19.0.0.tar.gz
+sha256	4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654  hyperlink-19.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256	9577b66fb599aa5700b4981078ab0a319416a086beee646cd282aa9f33c8c74c  LICENSE
diff --git a/package/python-hyperlink/python-hyperlink.mk b/package/python-hyperlink/python-hyperlink.mk
index 6681df4f90..deff4feac3 100644
--- a/package/python-hyperlink/python-hyperlink.mk
+++ b/package/python-hyperlink/python-hyperlink.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HYPERLINK_VERSION = 18.0.0
+PYTHON_HYPERLINK_VERSION = 19.0.0
 PYTHON_HYPERLINK_SOURCE = hyperlink-$(PYTHON_HYPERLINK_VERSION).tar.gz
-PYTHON_HYPERLINK_SITE = https://files.pythonhosted.org/packages/41/e1/0abd4b480ec04892b1db714560f8c855d43df81895c98506442babf3652f
+PYTHON_HYPERLINK_SITE = https://files.pythonhosted.org/packages/e0/46/1451027b513a75edf676d25a47f601ca00b06a6a7a109e5644d921e7462d
 PYTHON_HYPERLINK_SETUP_TYPE = setuptools
 PYTHON_HYPERLINK_LICENSE = MIT
 PYTHON_HYPERLINK_LICENSE_FILES = LICENSE
