From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:27:55 +0200
Subject: [Buildroot] [git commit] python-remi: bump to version 1.1
Message-ID: <20180508132739.E71FE8B91E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6beecfdfcd38e2aa49efe107c0c45994e85b2838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-remi/python-remi.hash | 2 +-
 package/python-remi/python-remi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index e3df6cbb03..870e882b73 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 69ab3f7438de76708bfc40396f791b76452f84bb8bca6dafbdaca510c17e9526  python-remi-v1.0.tar.gz
+sha256 bb82f3f329aef387b3823e7e9b9d06b85a7deb0a4dc9078a4323812e26abb459  python-remi-v1.1.tar.gz
 sha256 bc198f9846c1da3a1c1b1fa2b12909b021365d1e7fe9b4039245edfcec3b7f7f  LICENSE
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 3356430ddb..b6c50a3733 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = v1.0
+PYTHON_REMI_VERSION = v1.1
 PYTHON_REMI_SITE = $(call github,dddomodossola,remi,$(PYTHON_REMI_VERSION))
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_LICENSE_FILES = LICENSE
