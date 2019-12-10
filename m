From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Dec 2019 09:04:10 +0100
Subject: [Buildroot] [git commit] package/python-tqdm: bump to version 4.40.1
Message-ID: <20191210075709.DC85B88FFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbaec513e46bf8e70701f30d4d7b8b0e06275453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-tqdm/python-tqdm.hash | 4 ++--
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 63dea98cf2..8a61b29ad7 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/project/tqdm
-md5	84f1744e2cc097d9e824a2e201cca4a6  tqdm-4.37.0.tar.gz
-sha256	fca09992116d6dc3ad9789cf601a254081eb40d5c14c1863ab6cd10e15c2cb26  tqdm-4.37.0.tar.gz
+md5	285af1f905f4c375f03a86a667047950  tqdm-4.40.1.tar.gz
+sha256	e405d16c98fcf30725d0c9d493ed07302a18846b5452de5253030ccd18996f87  tqdm-4.40.1.tar.gz
 # Locally computed sha256 checksums
 sha256	1bbf12d09d437844527b3cdaba01d379dac651b5cbb5ebb0d764274684d2680b  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index 3aa562e22e..4ff4696e65 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.37.0
+PYTHON_TQDM_VERSION = 4.40.1
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/cc/7b/5878d4e1b01a2eb802f78ea277f2385072681cabefc8fb4fbdee28dd1869
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/4c/45/830c5c4bfaba60ef7d356a53c7751a86c81d148a16fda0daf3ac5ca8e288
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
