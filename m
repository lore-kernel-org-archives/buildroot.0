From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 22:33:18 +0100
Subject: [Buildroot] [git commit] package/python-twisted: bump to version
 19.10.0
Message-ID: <20191206220543.57AF8884B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c301c190f9c8364801949e30941461b9bfd6d6e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with
run-tests tests.package.test_python_twisted.TestPythonPy3Twisted -d ./dl -o ./o

Ran 1 test in 388.506s
OK

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 0b7aa62021..2ce30d0fb8 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5 5e9296a952430d288cdcdc6ad9eb5ee8 Twisted-19.7.0.tar.bz2
-sha256 d5db93026568f60cacdc0615fcd21d46f694a6bfad0ef3ff53cde2b4bb85a39d Twisted-19.7.0.tar.bz2
+md5 f2d70f7a66ecdf54152310164cceadfe Twisted-19.10.0.tar.bz2
+sha256 7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d Twisted-19.10.0.tar.bz2
 # Locally computed sha256
 sha256 85b798413ba885b06cc1b91efe857a39f694071c29b04e80d23ea26ee271d613 LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index da22ae77a3..71748fc90c 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 19.7.0
+PYTHON_TWISTED_VERSION = 19.10.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/61/31/3855dcacd1d3b2e60c0b4ccc8e727b8cd497bd7087d327d81a9f0cbb580c
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/0b/95/5fff90cd4093c79759d736e5f7c921c8eb7e5057a70d753cdb4e8e5895d7
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
