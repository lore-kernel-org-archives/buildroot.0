From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 21 Oct 2019 16:40:22 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-cheroot: bump to version
 8.2.1
In-Reply-To: <20191021134031.20586-1-asafka7@gmail.com>
References: <20191021134031.20586-1-asafka7@gmail.com>
Message-ID: <20191021134031.20586-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-cheroot/python-cheroot.hash | 4 ++--
 package/python-cheroot/python-cheroot.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index 4da20fd0fe..e8144abaf6 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cheroot/json
-md5	202a292846ce9ec84a1aeb2193ec2b35  cheroot-8.1.0.tar.gz
-sha256	3ff64073efa35b39d5e107410f5c79664dc8c6c5990651e970740c80ab8878a8  cheroot-8.1.0.tar.gz
+md5	7ace4b584a8092deb9f6b0142a627086  cheroot-8.2.1.tar.gz
+sha256	5b525b3e4a755adf78070ab54c1821fb860d4255a9317dba2b88eb2df2441cff  cheroot-8.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da6dc218683f6dab91c6367f00bf33095d980fb1f04d430c81c5e6994b8605e0  LICENSE.md
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index 169962923a..9eae887989 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 8.1.0
+PYTHON_CHEROOT_VERSION = 8.2.1
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/a1/6c/899c7de9323e440f7eda28fead4a84bd0ae5a557e6ebf8f12270cc502043
+PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/9b/4d/2e51e7ce60f54a5279e91648b9b9b497d4d22bc624ecae6af1b6866144a7
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
-- 
2.20.1
