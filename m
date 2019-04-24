From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:18:11 +0200
Subject: [Buildroot] [git commit] package/python-can: bump to version 3.1.1
Message-ID: <20190424201409.491788146D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5b613febc09ebfd6c03dda360e1832a7c403b93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps python-can to version 3.1.1, it removes md5 sum from
hash file cause it's not present anymore on the pypi website.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-can/python-can.hash | 5 ++---
 package/python-can/python-can.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index b2dc1a33c3..7e8a07fb4e 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/python-can/json
-md5	d906a220d8bd173c4f8de2bfe7217cc2  python-can-3.0.0.tar.gz
-sha256	0d2ddb3b663af51b11a4c7fb7a577c63302a831986239f82bb6af65efc065b07  python-can-3.0.0.tar.gz
+# sha256 from https://pypi.org/pypi/python-can/json
+sha256	99c06d05f8aa6fa9a84f39a11987c303c030411c3280e39bef0b5cd2242ad09f  python-can-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index ca023ee895..86ece99b08 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 3.0.0
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/29/47/59d07bb02d6b244fb631487ae5424a10658c316defeeb90c923b48043792
+PYTHON_CAN_VERSION = 3.1.1
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/c1/b0/72d7ed7840692ace5b55dd1155409cd86fd83cee4ded75e3d1102c08750a
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
