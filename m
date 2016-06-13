From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jun 2016 11:50:50 +0200
Subject: [Buildroot] [git commit] python-dataproperty: bump to version 0.3.1
Message-ID: <20160613095059.7F0C17FDD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=756fc17374389370a0eda6bf51bea8878a1052d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.3.1 makes pytest-runner dependency optional.

Fixes:
http://autobuild.buildroot.net/results/0c8/0c8e0ceccc2d5f48138ec4f95e57729e33108f59
http://autobuild.buildroot.net/results/eab/eab2d2bf78ac943156a0b8698e63bdf6e63865bf
http://autobuild.buildroot.net/results/4d6/4d60c711e9c1da6dd5bb809bbe328e6252d2d747
http://autobuild.buildroot.net/results/ed1/ed1982367fa1531d772d29b35e333b34e5889cec
http://autobuild.buildroot.net/results/a0e/a0ebb6b155fa11c5886080f993c9aa9d596ac1c3
http://autobuild.buildroot.net/results/85e/85e5086401a314a2d3d24efa887ac0188add85fc
http://autobuild.buildroot.net/results/99e/99ea243303ae12aceb2fac3a5df5e3b552712eda

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index bed956b..dd1b84c 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/dataproperty/json
-md5	2c513428b63d7988631c2e6f6c067cb6  DataProperty-0.3.0.tar.gz
+md5	b0dfde2908e26585db24ef51d2153ca5  DataProperty-0.3.1.tar.gz
 # sha256 calculated by scanpypi
-sha256	566a5e693ed51582df36a066d40673167095ce22187348038b07b7ac1ef9bc64  DataProperty-0.3.0.tar.gz
+sha256	12a5e97a7fba5a938ecadf24f8e9c0ed4f3fd045b84ec107d5fa5ce15c03f9ad  DataProperty-0.3.1.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 0bbe680..06b8caf 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.3.0
+PYTHON_DATAPROPERTY_VERSION = 0.3.1
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/05/07/2eb3d18d3efd4d90ac8d532255da04d0c10359eb3bc65d5690579b8bd7b0
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/94/84/a78a208b4fe3001e8fa1dc553122e3f27a807f26fee097f20714d6def70b
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
