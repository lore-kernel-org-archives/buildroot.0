From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 21:56:57 +0100
Subject: [Buildroot] [git commit] package/python-aiorwlock: bump to version
 0.6.0
Message-ID: <20190318205348.568258E378@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faeb44b5e2c79439b189b6399ea81cd9509920a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
 package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
index 51d1a29f20..8556f5ebd3 100644
--- a/package/python-aiorwlock/python-aiorwlock.hash
+++ b/package/python-aiorwlock/python-aiorwlock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
-md5	ee741761e4c9b1612e9dccf7f8bccdd0  aiorwlock-0.5.0.tar.gz
-sha256	3cd892576d024934d72c3dd098033f276ace3495e71a1197daa8d21409a52174  aiorwlock-0.5.0.tar.gz
+md5	8eccf28315b4f851f6f7e9332edeec52  aiorwlock-0.6.0.tar.gz
+sha256	cd310f33a7ea3bf6fd76fcf0c1ba6e4d7eef4d5ded59e95859494425fb7e599d  aiorwlock-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256	56fb2baf14d84c59c15abbfbb1fdf30a724017e2ce97894a8236764513d10397  LICENSE
diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
index ca6aa25294..48e74c02fd 100644
--- a/package/python-aiorwlock/python-aiorwlock.mk
+++ b/package/python-aiorwlock/python-aiorwlock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIORWLOCK_VERSION = 0.5.0
+PYTHON_AIORWLOCK_VERSION = 0.6.0
 PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
-PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/0c/20/d30f332e6ecb2be467ab5603e277b26e3a8eb2a72f75bf8d309bdd4c0c82
+PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/77/cf/2a2584c4fc1096ae959d7d189f205eb9c872ec58aca2cde16009d2d83b9e
 PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
 PYTHON_AIORWLOCK_LICENSE = Apache-2.0
 PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
