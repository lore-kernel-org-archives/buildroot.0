From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 17:43:05 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-flatbuffers: bump to version
 2.0
In-Reply-To: <20210612154305.545978-1-fontaine.fabrice@gmail.com>
References: <20210612154305.545978-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612154305.545978-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-flatbuffers/python-flatbuffers.hash | 4 ++--
 package/python-flatbuffers/python-flatbuffers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flatbuffers/python-flatbuffers.hash b/package/python-flatbuffers/python-flatbuffers.hash
index ba7df6babc..a27d94160a 100644
--- a/package/python-flatbuffers/python-flatbuffers.hash
+++ b/package/python-flatbuffers/python-flatbuffers.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flatbuffers/json
-md5  b9a5b8dfbbb4751788529310118ea6db  flatbuffers-1.12.tar.gz
-sha256  63bb9a722d5e373701913e226135b28a6f6ac200d5cc7b4d919fa38d73b44610  flatbuffers-1.12.tar.gz
+md5  b2ce60d9a7c1f8a2ddac6d49a1b700a4  flatbuffers-2.0.tar.gz
+sha256  12158ab0272375eab8db2d663ae97370c33f152b27801fa6024e1d6105fd4dd2  flatbuffers-2.0.tar.gz
diff --git a/package/python-flatbuffers/python-flatbuffers.mk b/package/python-flatbuffers/python-flatbuffers.mk
index 33bb57ddf3..705dc0ad5a 100644
--- a/package/python-flatbuffers/python-flatbuffers.mk
+++ b/package/python-flatbuffers/python-flatbuffers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLATBUFFERS_VERSION = 1.12
+PYTHON_FLATBUFFERS_VERSION = 2.0
 PYTHON_FLATBUFFERS_SOURCE = flatbuffers-$(PYTHON_FLATBUFFERS_VERSION).tar.gz
-PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/4d/c4/7b995ab9bf0c7eaf10c386d29a03408dfcf72648df4102b1f18896c3aeea
+PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/10/41/09e9ab2134895b82466fada08b69b800f9a724bc81fcca3d4474ce48ffce
 PYTHON_FLATBUFFERS_LICENSE = Apache-2.0
 PYTHON_FLATBUFFERS_SETUP_TYPE = setuptools
 
-- 
2.30.2
