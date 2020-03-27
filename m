From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2020 10:03:19 +0100
Subject: [Buildroot] [git commit] package/python-crossbar: bump to version
 20.2.1
Message-ID: <20200327085224.8287D80FA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3f0e7a7a12b7bdf284bb922d7f790be6522c0bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crossbar/python-crossbar.hash | 4 ++--
 package/python-crossbar/python-crossbar.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index 903d11d330..1be4c72b76 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crossbar/json
-md5	f19fb0995f42e2970fb1b1b077b01d61  crossbar-20.1.2.tar.gz
-sha256	3f4ee0bc73d7e6d25af74b163495eb8892bfe2f0ccbc3153dc4cf807af6163fa  crossbar-20.1.2.tar.gz
+md5  bacb1f25cbf8fcdd0568325ef04a721c  crossbar-20.2.1.tar.gz
+sha256  a63951780fde8c46834c70a637d97f3b2028da637b7a4f793b624532f7a45863  crossbar-20.2.1.tar.gz
 # Locally computed
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  crossbar/LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index df4d7cc4d5..84d4177daa 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 20.1.2
+PYTHON_CROSSBAR_VERSION = 20.2.1
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/2a/cd/e8be30a9ba4db52dc04e530f19a24d225d743aa36f5074ec0b3ef316637a
+PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/78/f0/82970d84abd532bdea007322b73bfe2d7762194b85155296b76ba48724e9
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = crossbar/LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
