From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:22:41 +0100
Subject: [Buildroot] [git commit] package/python{,
 3}-mako: bump to version 1.1.1
Message-ID: <20200309140906.93DA7821F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1da9e37bd785205c49dad124353a11adbab2cfbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change is due to date update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 package/python3-mako/python3-mako.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index 0f0dadcd0c..a1c18c9916 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5	6c3f2da0b74af529a4c4a537d0848bf2  Mako-1.1.0.tar.gz
-sha256	a36919599a9b7dc5d86a7a8988f23a9a3a3d083070023bab23d64f7f1d1e0a4b  Mako-1.1.0.tar.gz
+md5	2660a4916f2f63456e6885c727b7cd2f  Mako-1.1.1.tar.gz
+sha256	2984a6733e1d472796ceef37ad48c26f4a984bb18119bb2dbc37a44d8f6e75a4  Mako-1.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256	c3b124673c93872156757a934c75b498d68eec09510e25e549d9dc2013776499  LICENSE
+sha256	47cd0d41b1092f9161cfb629ed15e5cea185144710ff4633a4281ef088ff5de7  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 622359493a..5be9937fee 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python3-mako/python3-mako.mk
-PYTHON_MAKO_VERSION = 1.1.0
+PYTHON_MAKO_VERSION = 1.1.1
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/b0/3c/8dcd6883d009f7cae0f3157fb53e9afb05a0d3d33b3db1268ec2e6f4a56b
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/28/03/329b21f00243fc2d3815399413845dbbfb0745cff38a29d3597e97f8be58
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
diff --git a/package/python3-mako/python3-mako.mk b/package/python3-mako/python3-mako.mk
index 31df4194eb..6d5c1a185e 100644
--- a/package/python3-mako/python3-mako.mk
+++ b/package/python3-mako/python3-mako.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-mako/python-mako.mk
-PYTHON3_MAKO_VERSION = 1.1.0
+PYTHON3_MAKO_VERSION = 1.1.1
 PYTHON3_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON3_MAKO_SITE = https://files.pythonhosted.org/packages/b0/3c/8dcd6883d009f7cae0f3157fb53e9afb05a0d3d33b3db1268ec2e6f4a56b
+PYTHON3_MAKO_SITE = https://files.pythonhosted.org/packages/28/03/329b21f00243fc2d3815399413845dbbfb0745cff38a29d3597e97f8be58
 PYTHON3_MAKO_SETUP_TYPE = setuptools
 PYTHON3_MAKO_LICENSE = MIT
 PYTHON3_MAKO_LICENSE_FILES = LICENSE
