From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun,  7 Jun 2020 18:03:05 +0200
Subject: [Buildroot] [PATCH] package/python-can: bump to version 3.3.3
Message-ID: <20200607160305.110673-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps python-can to version 3.3.3.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-can/python-can.hash | 2 +-
 package/python-can/python-can.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 0a945eb006..ced51d8b75 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/pypi/python-can/json
-sha256	8dc9e0f926e880cd57a3badbaebc6393cde7adffdd3e1975a78a82c48d4e3bbe  python-can-3.3.1.tar.gz
+sha256	ecd69cf6b2f0235345ebe607a15325cf1384c85b24ffbe1d68c3754357f87488  python-can-3.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 749583f961..158e89f204 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 3.3.1
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/d1/7e/d92889e3fa6ed625b5d6f065bff1c1b5921519a5133553905affb0d6b97c
+PYTHON_CAN_VERSION = 3.3.3
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/b0/fa/8c6eb8988130f256db4c3cf84537c44684dbb3d528d2e1a1d2209eac4d90
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
