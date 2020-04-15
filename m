From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:35:54 +0200
Subject: [Buildroot] [git commit] package/python-flatbuffers: bump to
 version 1.12
Message-ID: <20200415192340.73F528E15A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61d1899b826968bf006cc174eb89ce3236491085
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flatbuffers/python-flatbuffers.hash | 4 ++--
 package/python-flatbuffers/python-flatbuffers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flatbuffers/python-flatbuffers.hash b/package/python-flatbuffers/python-flatbuffers.hash
index 0cb5437906..ba7df6babc 100644
--- a/package/python-flatbuffers/python-flatbuffers.hash
+++ b/package/python-flatbuffers/python-flatbuffers.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flatbuffers/json
-md5  b5f6c2246f45636dd49d9ff8a00d7f1c  flatbuffers-1.11.tar.gz
-sha256  f24185db54193540e3d684dc98aa7c2d89882341641548ceb36fd2589fef6c4e  flatbuffers-1.11.tar.gz
+md5  b9a5b8dfbbb4751788529310118ea6db  flatbuffers-1.12.tar.gz
+sha256  63bb9a722d5e373701913e226135b28a6f6ac200d5cc7b4d919fa38d73b44610  flatbuffers-1.12.tar.gz
diff --git a/package/python-flatbuffers/python-flatbuffers.mk b/package/python-flatbuffers/python-flatbuffers.mk
index d0374c4787..33bb57ddf3 100644
--- a/package/python-flatbuffers/python-flatbuffers.mk
+++ b/package/python-flatbuffers/python-flatbuffers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLATBUFFERS_VERSION = 1.11
+PYTHON_FLATBUFFERS_VERSION = 1.12
 PYTHON_FLATBUFFERS_SOURCE = flatbuffers-$(PYTHON_FLATBUFFERS_VERSION).tar.gz
-PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/c6/b6/21478b76aa7ccab58da3beb85746b6844dee2112c0cc25b51ec64b46bdbb
+PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/4d/c4/7b995ab9bf0c7eaf10c386d29a03408dfcf72648df4102b1f18896c3aeea
 PYTHON_FLATBUFFERS_LICENSE = Apache-2.0
 PYTHON_FLATBUFFERS_SETUP_TYPE = setuptools
 
