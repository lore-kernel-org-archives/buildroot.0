From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2020 10:03:06 +0100
Subject: [Buildroot] [git commit] package/python-automat: bump to version
 20.2.0
Message-ID: <20200327085224.6EC7288556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a6a9878e3a0cd5b4e1dc3a0f7e89893f3040598
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-automat/python-automat.hash | 6 +++---
 package/python-automat/python-automat.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-automat/python-automat.hash b/package/python-automat/python-automat.hash
index 1be91e0e91..33a64abedf 100644
--- a/package/python-automat/python-automat.hash
+++ b/package/python-automat/python-automat.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/automat/json
-md5	47e980a48201a1dabe37fa11f0187013  Automat-0.8.0.tar.gz
-sha256	269a09dfb063a3b078983f4976d83f0a0d3e6e7aaf8e27d8df1095e09dc4a484  Automat-0.8.0.tar.gz
+md5  d6cef9886b037b8857bfbc686f3ae30a  Automat-20.2.0.tar.gz
+sha256  7979803c74610e11ef0c0d68a2942b152df52da55336e0c9d58daf1831cbdf33  Automat-20.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256	b2201301678d0a937d938543827ca1360712eb34e23de8ee3f3bfffbd4c0e376  LICENSE
+sha256  b2201301678d0a937d938543827ca1360712eb34e23de8ee3f3bfffbd4c0e376  LICENSE
diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index 0bd40daf76..b94fd2e1c4 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOMAT_VERSION = 0.8.0
+PYTHON_AUTOMAT_VERSION = 20.2.0
 PYTHON_AUTOMAT_SOURCE = Automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
-PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/4c/9a/3052851fa3a888d1ff32f053fba424ed929b47383fb5327855fdf70018cd
+PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/80/c5/82c63bad570f4ef745cc5c2f0713c8eddcd07153b4bee7f72a8dc9f9384b
 PYTHON_AUTOMAT_SETUP_TYPE = setuptools
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
