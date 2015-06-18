From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 23:41:28 +0200
Subject: [Buildroot] [git commit] python-pyinotify: bump to 0.9.6
Message-ID: <20150618214132.DC68981E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6f3f3e6dd0887b8315e84795f7d2b2516c9d766
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove hash file as the project doesn't provide manual tarballs
on GitHub.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyinotify/python-pyinotify.hash |    2 --
 package/python-pyinotify/python-pyinotify.mk   |    2 +-
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/python-pyinotify/python-pyinotify.hash b/package/python-pyinotify/python-pyinotify.hash
deleted file mode 100644
index a51718d..0000000
--- a/package/python-pyinotify/python-pyinotify.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256  d22d94e5f1dfd19ff2f98b9bb9b31a869892652389b8f5c0a27c7de77550b1e4  python-pyinotify-0.9.5.tar.gz
diff --git a/package/python-pyinotify/python-pyinotify.mk b/package/python-pyinotify/python-pyinotify.mk
index e43dcd0..b4ea662 100644
--- a/package/python-pyinotify/python-pyinotify.mk
+++ b/package/python-pyinotify/python-pyinotify.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYINOTIFY_VERSION = 0.9.5
+PYTHON_PYINOTIFY_VERSION = 0.9.6
 PYTHON_PYINOTIFY_SITE = $(call github,seb-m,pyinotify,$(PYTHON_PYINOTIFY_VERSION))
 PYTHON_PYINOTIFY_SETUP_TYPE = setuptools
 PYTHON_PYINOTIFY_LICENSE = MIT
