From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 10:01:10 +0200
Subject: [Buildroot] [git commit] python-txtorcon: bump to version 18.3.0
Message-ID: <20181014075950.8285F83675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=504858caced7f18d51c4ac5512f57a961bec1c72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txtorcon/python-txtorcon.hash | 4 ++--
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index 9a4eafc0a1..d46a7769dc 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txtorcon/json
-md5    a7df623f400668daf588a6f028864c52  txtorcon-18.2.0.tar.gz
-sha256 b1714dfa633cb4097c9ea649c8c49657d9d22a990cc465bb904620428c5e684e  txtorcon-18.2.0.tar.gz
+md5    31492e847973710f6533e9979a134ffa  txtorcon-18.3.0.tar.gz
+sha256 5601956b3a2452526cd1ea31662696a51ddbf8ed6452633ee464fc1ff275f8b0  txtorcon-18.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256 3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index a02ec3626e..6ebcdb4f90 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 18.2.0
+PYTHON_TXTORCON_VERSION = 18.3.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/08/02/5a38afe0c96bd8da466716f51c72b3b52d3a76399e62b37494b97489f74a
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/a2/71/2fe0c7d9350ff95cd22128f375dbf2b49438ca1a5d8ca0795311a964586b
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
