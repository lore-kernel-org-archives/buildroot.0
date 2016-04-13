From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 21:59:09 +0200
Subject: [Buildroot] [git commit] python-pyroute2: bump to version 0.3.20
Message-ID: <20160413195937.25317801D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40a9670cff9f6e4eb69c8f646ee1e3c92d8d3565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyroute2/python-pyroute2.hash | 6 +++---
 package/python-pyroute2/python-pyroute2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index 69b87c7..df9ff02 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=1c780304d18461611fe9ffaf7582bd82, sha256 locally computed
-md5     1c780304d18461611fe9ffaf7582bd82  pyroute2-0.3.16.tar.gz
-sha256  670fe054d2f262e0d679b3bb25094e0a508b67a8c5df5d45be9d1482d191b7b5  pyroute2-0.3.16.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=459b4020073b767cc129e360dabbd2d7, sha256 locally computed
+md5     459b4020073b767cc129e360dabbd2d7  pyroute2-0.3.20.tar.gz
+sha256  ed28856753b941d4277b2f14b89c9edec35be4c97e1831f900fe4ce6fc12161b  pyroute2-0.3.20.tar.gz
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index 7317979..2e9e0dd 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PYTHON_PYROUTE2_VERSION = 0.3.16
+PYTHON_PYROUTE2_VERSION = 0.3.20
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
 PYTHON_PYROUTE2_SITE = https://pypi.python.org/packages/source/p/pyroute2
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPLv2+
