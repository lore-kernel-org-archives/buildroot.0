From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2020 10:05:33 +0100
Subject: [Buildroot] [git commit] package/python-twisted: bump to version
 20.3.0
Message-ID: <20200327085224.A8EDB810FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99fb506cdf114d9dc061151c96138cce4c9fe67c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update in the copyright year of the license file:

-Copyright (c) 2001-2019
+Copyright (c) 2001-2020

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 2ce30d0fb8..c633112e9d 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5 f2d70f7a66ecdf54152310164cceadfe Twisted-19.10.0.tar.bz2
-sha256 7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d Twisted-19.10.0.tar.bz2
+md5  fc16d575730db7d0cddd09fc35af3eea  Twisted-20.3.0.tar.bz2
+sha256  d72c55b5d56e176563b91d11952d13b01af8725c623e498db5507b6614fc1e10  Twisted-20.3.0.tar.bz2
 # Locally computed sha256
-sha256 85b798413ba885b06cc1b91efe857a39f694071c29b04e80d23ea26ee271d613 LICENSE
+sha256  98426fd47315df70098e0d85efbb5d7dd8001c9c536386937354640d6d8d75b9  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 71748fc90c..2478972f82 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 19.10.0
+PYTHON_TWISTED_VERSION = 20.3.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/0b/95/5fff90cd4093c79759d736e5f7c921c8eb7e5057a70d753cdb4e8e5895d7
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/4a/b4/4973c7ccb5be2ec0abc779b7d5f9d5f24b17b0349e23240cfc9dc3bd83cc
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
