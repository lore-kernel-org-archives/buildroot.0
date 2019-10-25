From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 25 Oct 2019 21:54:44 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 7.9.0
In-Reply-To: <20191025185448.32633-1-asafka7@gmail.com>
References: <20191025185448.32633-1-asafka7@gmail.com>
Message-ID: <20191025185448.32633-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And fix indentation in hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ipython/python-ipython.hash | 6 +++---
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 81544a6bf1..37768a835d 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5	4cf3010770ce20f3227c38f117c4b311  ipython-7.8.0.tar.gz
-sha256	dd76831f065f17bddd7eaa5c781f5ea32de5ef217592cf019e34043b56895aa1  ipython-7.8.0.tar.gz
+md5	68542bca2ebf39af7d9d0557e7fb5708  ipython-7.9.0.tar.gz
+sha256	dfd303b270b7b5232b3d08bd30ec6fd685d8a58cabd54055e3d69d8f029f7280  ipython-7.9.0.tar.gz
 # Locally computed sha256 checksums
-sha256	341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17 COPYING.rst
+sha256	341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256	e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 3d8d9e868a..f340e9b013 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 7.8.0
+PYTHON_IPYTHON_VERSION = 7.9.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/89/60/acb98588d8eba96558e69d90fa54f9908b4e48f6492ff378697f0c2216e2
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c0/e5/ba19ae58e9bdd80832332873cb4e11a90cf2049df052c1aadeabc2cdadeb
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_SETUP_TYPE = distutils
-- 
2.20.1
