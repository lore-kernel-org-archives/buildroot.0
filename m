From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:30:18 +0100
Subject: [Buildroot] [git commit] package/python-colorlog: bump to version
 4.1.0
Message-ID: <20200106222032.3EBF582A8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8282a6104e8fb83447deb38d734c352e9657646f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-colorlog/python-colorlog.hash | 4 ++--
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index c31c5c7ca8..b7b27b59d9 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5	292f0e1ecdea0910f4ea514378c6be29  colorlog-4.0.2.tar.gz
-sha256	3cf31b25cbc8f86ec01fef582ef3b840950dea414084ed19ab922c8b493f9b42  colorlog-4.0.2.tar.gz
+md5	25f79b76421132e2a9e08da15e4e0a73  colorlog-4.1.0.tar.gz
+sha256	30aaef5ab2a1873dec5da38fd6ba568fa761c9fa10b40241027fa3edea47f3d2  colorlog-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256	915d2c0c578d5015fb561f69ce2970a0d0ed566f0b99bdb6a4ebb439e9c81b0d  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index 8191dbaa0f..18c077e4ab 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 4.0.2
+PYTHON_COLORLOG_VERSION = 4.1.0
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/fc/30/6ba1282b773e9f44d9cfaafa38b6cc180441307c5fe0edd8db13a8903e3f
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/a5/51/c6e1f2c7e6d7524b580d5a8d7691fd4530f894ae8a23ba66a065291ceba2
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
