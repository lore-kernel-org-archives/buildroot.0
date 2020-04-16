From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Apr 2020 04:58:41 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-mbstrdecoder: bump to
 version 1.0.0
Message-ID: <20200416105841.61664-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit hash change is due to line endings change not in upstream
git repo.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 6 +++---
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index b46f5d7cf9..f8103b0add 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mbstrdecoder/json
-md5	6dd814b20e7c68c2da2afe5bf72a5e9d  mbstrdecoder-0.8.1.tar.gz
-sha256	dabfae008a6b3b78f09847c2a73e9e866f97dcd9b52f7ccadf3b05a10a3656e6  mbstrdecoder-0.8.1.tar.gz
+md5  3ab822b853bfd2f08e35ba85c1ac2e2e  mbstrdecoder-1.0.0.tar.gz
+sha256  9df7778c0c051c98f6b5a848909202e5cd423c9692665b20d1a9bd0f771b8235  mbstrdecoder-1.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	7fcef461a93fea587224132a865d1285969c9bec15baf59caeb7a8c7638a8744  LICENSE
+sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index 4400cd6731..4a768ef695 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 0.8.1
+PYTHON_MBSTRDECODER_VERSION = 1.0.0
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/fd/0f/11982e1321f484b5ec85bb3e03878c9636ca5328fbcbed8b25ecbd76fd44
+PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/5e/05/7dd1704e3e1522757708f59e727b540a6e5032ba6bb20e73851da7111b11
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
-- 
2.20.1
