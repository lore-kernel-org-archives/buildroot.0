From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:32:59 +0100
Subject: [Buildroot] [git commit] python-cryptography: bump to version 1.3.1
Message-ID: <20160324213322.64098819ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbe3270ac3f0aba50cc31d2f346c21c40a2c3417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cryptography/python-cryptography.hash | 6 +++---
 package/python-cryptography/python-cryptography.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index e48e2e2..fa15fa0 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,4 +1,4 @@
-# From https://pypi.python.org/pypi?:action=show_md5&digest=5474d2b3e8c7555a60852e48d2743f85
-md5     5474d2b3e8c7555a60852e48d2743f85  cryptography-1.2.3.tar.gz
+# From https://pypi.python.org/pypi?:action=show_md5&digest=bc8148d2ff2d80fef8ef2d2e856b3a7f
+md5     bc8148d2ff2d80fef8ef2d2e856b3a7f  cryptography-1.3.1.tar.gz
 # Calculated based on the hash above
-sha256  8eb11c77dd8e73f48df6b2f7a7e16173fe0fe8fdfe266232832e88477e08454e  cryptography-1.2.3.tar.gz
+sha256  b4b36175e0f95ddc88435c26dbe3397edce48e2ff5fe41d504cdb3beddcd53e2  cryptography-1.3.1.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 1f91422..1b5eb9c 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 1.2.3
+PYTHON_CRYPTOGRAPHY_VERSION = 1.3.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/source/c/cryptography
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
