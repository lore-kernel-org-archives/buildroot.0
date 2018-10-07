From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 21:26:26 +0200
Subject: [Buildroot] [git commit] python-txtorcon: bump to version 18.2.0
Message-ID: <20181007193350.61F1C8E015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25f7a819e030378f0ccffb7784b47f1e5e525317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-txtorcon/python-txtorcon.hash | 4 ++--
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index ecb9726b7a..9a4eafc0a1 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txtorcon/json
-md5    2b39f371ae08cd7cac34caed7d6aaa56  txtorcon-18.1.0.tar.gz
-sha256 b61cf175a5f1d4092609caf05d178fcdcabf513928eec98d38125c501afea43c  txtorcon-18.1.0.tar.gz
+md5    a7df623f400668daf588a6f028864c52  txtorcon-18.2.0.tar.gz
+sha256 b1714dfa633cb4097c9ea649c8c49657d9d22a990cc465bb904620428c5e684e  txtorcon-18.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256 3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index 7f12e62f4f..a02ec3626e 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 18.1.0
+PYTHON_TXTORCON_VERSION = 18.2.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/d5/e1/577e28231013fffdc97c3078bbd37d9001e6cbea757b0b10da34d765dc32
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/08/02/5a38afe0c96bd8da466716f51c72b3b52d3a76399e62b37494b97489f74a
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
