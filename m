From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:31 +0200
Subject: [Buildroot] [git commit] package/python-cryptography: bump version
	to 1.5.2
Message-ID: <20161005210758.0553C80301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0b2d247266728972d1a0b681e81fa5f0d60ccb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cryptography/python-cryptography.hash | 7 +++----
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 3f8f61b..60fe3eb 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,4 +1,3 @@
-# From https://pypi.python.org/pypi?:action=show_md5&digest=defd153ed901089f5aeac6eb066d5ef7
-md5     defd153ed901089f5aeac6eb066d5ef7  cryptography-1.3.4.tar.gz
-# Calculated based on the hash above
-sha256  423ff890c01be7c70dbfeaa967eeef5146f1a43a5f810ffdc07b178e48a105a9  cryptography-1.3.4.tar.gz
+# md5 from https://pypi.python.org/pypi/cryptography/json, sha256 locally computed
+md5	f977a6ddb38b071213c0157fc77c62ab  cryptography-1.5.2.tar.gz
+sha256	eb8875736734e8e870b09be43b17f40472dc189b1c422a952fa8580768204832  cryptography-1.5.2.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index fe392f9..75e6bb3 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 1.3.4
+PYTHON_CRYPTOGRAPHY_VERSION = 1.5.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/f8/70/d7bd5c9c764732d5876ad34293e1ca55b2305a73ae6fcf1312202d1a798e
+PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/03/1a/60984cb85cc38c4ebdfca27b32a6df6f1914959d8790f5a349608c78be61
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3c
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
