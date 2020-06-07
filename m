From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun,  7 Jun 2020 18:15:19 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 7.1.2
Message-ID: <20200607161519.133543-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package bumps python-pillow to version 7.1.2.
It updates also the LICENSE hash cause of a copyright year update.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 0d66c4bb3c..d222645633 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/project/Pillow/
-md5	d099946335c1ba372f5b1fa68ca71645  Pillow-7.0.0.tar.gz
-sha256	4d9ed9a64095e031435af120d3c910148067087541131e82b3e8db302f4c8946  Pillow-7.0.0.tar.gz
+md5	f1f7592c51260e5080d3cd71781ea675  Pillow-7.1.2.tar.gz
+sha256	a0b49960110bc6ff5fead46013bcb8825d101026d466f3a4de3476defe0fb0dd  Pillow-7.1.2.tar.gz
 # Locally computed sha256 checksums
-sha256	04a04a908e52921829c7f51528e5619c79becdde99c484ab7d4f235e2927968c  LICENSE
+sha256	37de42abe33a247e8f03d2313657a0f174a239a198f526add6544ff3e2643b81  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 5ff2dcfdb6..2832eeee0b 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 7.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/39/47/f28067b187dd664d205f75b07dcc6e0e95703e134008a14814827eebcaab
+PYTHON_PILLOW_VERSION = 7.1.2
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/ce/ef/e793f6ffe245c960c42492d0bb50f8d14e2ba223f1922a5c3c81569cec44
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.25.1
