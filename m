From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:49 +0200
Subject: [Buildroot] [git commit] package/python-posix-ipc: bump version to
	1.0.0
Message-ID: <20161005210758.AF0A58022D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f39c415576c5a178b2d4cca6ef518922278eb004
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-posix-ipc/python-posix-ipc.hash | 5 +++--
 package/python-posix-ipc/python-posix-ipc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index 95ef4da..196f186 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  24e092ba995122869a2fca46a2579b1b2824cfdcb2ecc6938e2923a120460646  posix_ipc-0.9.6.tar.gz
+# md5 from https://pypi.python.org/pypi/posix-ipc/json, sha256 locally computed
+md5	85607a392087715ac3a3c7ded2492d06  posix_ipc-1.0.0.tar.gz
+sha256	9c93070374ca672725575e5c9874930c8cde69367fb90378b2255e048e31efcb  posix_ipc-1.0.0.tar.gz
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index 5fa7471..7916537 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 0.9.6
+PYTHON_POSIX_IPC_VERSION = 1.0.0
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = http://semanchuk.com/philip/posix_ipc
+PYTHON_POSIX_IPC_SITE = https://pypi.python.org/packages/f0/e6/bff62b62b2e75f695b737695951b7a4c1c6595369268a37868f5c34e1c12
 PYTHON_POSIX_IPC_LICENSE = BSD-3c
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = distutils
