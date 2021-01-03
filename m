From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jan 2021 11:37:47 +0100
Subject: [Buildroot] [git commit] package/python3: bump version to 3.9.1
Message-ID: <20210103102023.5C54D83E5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cde875bf8be463f2d626a3cedca74bce54ad591e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.python.org/downloads/release/python-391/

Changelog:
https://docs.python.org/release/3.9.1/whatsnew/changelog.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 3de1e8353a..2165daffcc 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-390/
-md5  6ebfe157f6e88d9eabfbaf3fa92129f6  Python-3.9.0.tar.xz
+# From https://www.python.org/downloads/release/python-391/
+md5  61981498e75ac8f00adcb908281fadb6  Python-3.9.1.tar.xz
 # Locally computed
-sha256  9c73e63c99855709b9be0b3cc9e5b072cb60f37311e8c4e50f15576a0bf82854  Python-3.9.0.tar.xz
+sha256  991c3f8ac97992f3d308fefeb03a64db462574eadbff34ce8bc5bb583d9903ff  Python-3.9.1.tar.xz
 sha256  1dceef1677a39befa8bf0285ab2db441ba117520bb2de839547ace006a17750d  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d4e08e91d5..f2516dee90 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.9
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
