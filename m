From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 14:18:53 +0100
Subject: [Buildroot] [git commit] python-cffi: bump version to 1.11.2
Message-ID: <20171102131141.54FF180478@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cf80fa0e0e680ece2cf55e496e6e5b416a56b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licence file checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cffi/python-cffi.hash | 5 +++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index f6b139d..3d4387f 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/cffi/json, sha256 locally computed
-md5 2b5fa41182ed0edaf929a789e602a070 cffi-1.10.0.tar.gz
-sha256 b3b02911eb1f6ada203b0763ba924234629b51586f72a21faacc638269f4ced5 cffi-1.10.0.tar.gz
+md5	a731487324b501c8295221b629d3f5f3  cffi-1.11.2.tar.gz
+sha256	ab87dd91c0c4073758d07334c1e5f712ce8fe48f007b86f8238773963ee700a6  cffi-1.11.2.tar.gz
+sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index da95f7d..1ef8391 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.10.0
+PYTHON_CFFI_VERSION = 1.11.2
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://pypi.python.org/packages/5b/b9/790f8eafcdab455bcd3bd908161f802c9ce5adbf702a83aa7712fcc345b7
+PYTHON_CFFI_SITE = https://pypi.python.org/packages/c9/70/89b68b6600d479034276fed316e14b9107d50a62f5627da37fafe083fde3
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
