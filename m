From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 21:20:08 +0200
Subject: [Buildroot] [git commit] package/python-ipython: bump to version
 7.8.0
Message-ID: <20191018191756.72379826DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a59a4cc42aa72eecb68b1888c657fe35f998aabd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And fix indentation in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ipython/python-ipython.hash | 10 +++++-----
 package/python-ipython/python-ipython.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 70c3c904db..81544a6bf1 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5 826178c87b7b96651ce8b26a779e3016 ipython-7.4.0.tar.gz
-sha256 b038baa489c38f6d853a3cfc4c635b0cda66f2864d136fe8f40c1a6e334e2a6b ipython-7.4.0.tar.gz
-# Locally computed sha256
-sha256 341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17 COPYING.rst
-sha256 e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb LICENSE
+md5	4cf3010770ce20f3227c38f117c4b311  ipython-7.8.0.tar.gz
+sha256	dd76831f065f17bddd7eaa5c781f5ea32de5ef217592cf019e34043b56895aa1  ipython-7.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256	341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17 COPYING.rst
+sha256	e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index cd756b131e..3d8d9e868a 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 7.4.0
+PYTHON_IPYTHON_VERSION = 7.8.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/e3/88/39c8b7701b2f7d5c8f3a1796b0c174f21071232bc5b242feb670e913acc6
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/89/60/acb98588d8eba96558e69d90fa54f9908b4e48f6492ff378697f0c2216e2
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_SETUP_TYPE = distutils
