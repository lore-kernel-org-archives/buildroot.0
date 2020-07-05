From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:27:41 +0200
Subject: [Buildroot] [git commit] package/python-pyparted: bump version to
 3.11.6
Message-ID: <20200705135158.2E6B3805F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c8759afcf30dc862e21417a0bd422459458cde9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyparted/python-pyparted.hash | 2 +-
 package/python-pyparted/python-pyparted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyparted/python-pyparted.hash b/package/python-pyparted/python-pyparted.hash
index 61960f469d..0c3e4a15fd 100644
--- a/package/python-pyparted/python-pyparted.hash
+++ b/package/python-pyparted/python-pyparted.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a9ec181bf3c7c0635862413fc86cb0950b5af957541535f530ea86a0f9d14e73  python-pyparted-3.11.0.tar.gz
+sha256  d214288ae1a70b5925861ce01b3352378eb6b1419aa3b786f509e9ef2a501c02  python-pyparted-3.11.6.tar.gz
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
index c4783459ab..9d48fd9351 100644
--- a/package/python-pyparted/python-pyparted.mk
+++ b/package/python-pyparted/python-pyparted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYPARTED_VERSION = 3.11.0
+PYTHON_PYPARTED_VERSION = 3.11.6
 PYTHON_PYPARTED_SITE = $(call github,rhinstaller,pyparted,v$(PYTHON_PYPARTED_VERSION))
 PYTHON_PYPARTED_SETUP_TYPE = distutils
 PYTHON_PYPARTED_LICENSE = GPL-2.0+
