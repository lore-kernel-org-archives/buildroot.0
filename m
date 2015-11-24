From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Nov 2015 19:43:50 +0100
Subject: [Buildroot] [git commit branch/next] python/web2py: bump to version
	2.12.3 - hash file
Message-ID: <20151124184421.DEAFD81E89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d5158fd62ae9ea2e608f43f2db445aed4613e67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps web2py to the latest released version (2.12.3)
and adds hash file.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-web2py/python-web2py.hash |    2 ++
 package/python-web2py/python-web2py.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
new file mode 100644
index 0000000..3de8dbf
--- /dev/null
+++ b/package/python-web2py/python-web2py.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 7e22a5624d8d2909e165110f0bec6b43ee36ff6834d689f4027e06dece662031   python-web2py-R-2.12.3.tar.gz
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index f5f572c..38faabc 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = R-2.11.3
+PYTHON_WEB2PY_VERSION = R-2.12.3
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPLv3
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
