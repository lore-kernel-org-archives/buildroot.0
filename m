From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 09:14:58 +0200
Subject: [Buildroot] [git commit] package/python-scapy: bump to version 2.4.4
Message-ID: <20200904070710.48FB28732F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=841b453fcb22c6035236f5e0085a01b29a58af68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And use two space for hash file indentation.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-scapy/python-scapy.hash | 6 +++---
 package/python-scapy/python-scapy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index df7eeb8eab..8618e54f4b 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5	469ae6f5615799a5de3f3b4eb217b18d  scapy-2.4.3.tar.gz
-sha256	e2f8d11f6a941c14a789ae8b236b27bd634681f1b29b5e893861e284d234f6b0  scapy-2.4.3.tar.gz
+md5  01e52ff5d1f04364e17fc2d42872282e  scapy-2.4.4.tar.gz
+sha256  ecfd7a14cd9c3ef0eb08d28d5bb71d97219edff1454ccbdff229f676b27900ee  scapy-2.4.4.tar.gz
 # Locally computed sha256 checksums
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index f6cf2a07b3..3d9a4e1914 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.4.3
+PYTHON_SCAPY_VERSION = 2.4.4
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/52/e7/464079606a9cf97ad04936c52a5324d14dae36215f9319bf3faa46a7907d
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/c6/8f/438d4d0bab4c8e22906a7401dd082b4c0f914daf2bbdc7e7e8390d81a5c3
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
