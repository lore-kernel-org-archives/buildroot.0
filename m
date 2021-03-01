From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 22:35:20 +0100
Subject: [Buildroot] [git commit branch/next] package/python-colorlog: bump
 to version 4.7.2
Message-ID: <20210301211349.7029581585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17ee49fe2599a0b229d3723a15a9dd775a0a9dd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-colorlog/python-colorlog.hash | 6 +++---
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index b7b27b59d9..4613cf0d3c 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5	25f79b76421132e2a9e08da15e4e0a73  colorlog-4.1.0.tar.gz
-sha256	30aaef5ab2a1873dec5da38fd6ba568fa761c9fa10b40241027fa3edea47f3d2  colorlog-4.1.0.tar.gz
+md5  28500337c5bffc2a90dd19551479c992  colorlog-4.7.2.tar.gz
+sha256  18d05b616438a75762d7d214b9ec3b05d274466c9f3ddd92807e755840c88251  colorlog-4.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256	915d2c0c578d5015fb561f69ce2970a0d0ed566f0b99bdb6a4ebb439e9c81b0d  LICENSE
+sha256  915d2c0c578d5015fb561f69ce2970a0d0ed566f0b99bdb6a4ebb439e9c81b0d  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index 18c077e4ab..ba1ef7247b 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 4.1.0
+PYTHON_COLORLOG_VERSION = 4.7.2
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/a5/51/c6e1f2c7e6d7524b580d5a8d7691fd4530f894ae8a23ba66a065291ceba2
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/b2/d8/7bd0e6aa6b7dc93611f90a847eefcd048d3cae66dc8867c72486362bdfbd
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
