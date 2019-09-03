From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:35 -0000
Subject: [Buildroot] [git commit] package/python-aiomonitor: bump to version
 0.4.4
Message-ID: <20190903133619.6E22A8A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3416488db66dd0848af486d34599587d8047fd84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiomonitor/python-aiomonitor.hash | 4 ++--
 package/python-aiomonitor/python-aiomonitor.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
index ddcfd071e2..14a4466ddd 100644
--- a/package/python-aiomonitor/python-aiomonitor.hash
+++ b/package/python-aiomonitor/python-aiomonitor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomonitor/json
-md5	0f58ac68497a59d104ecb6ba369df784  aiomonitor-0.4.3.tar.gz
-sha256	37cd279c26e2c80b4e6ed9d23476c84c0b75fc3794617fceb6f341437b9af5fe  aiomonitor-0.4.3.tar.gz
+md5	38028c80adf5708ad5f7adadf0fdf404  aiomonitor-0.4.4.tar.gz
+sha256	c3e0d79cb637baa06ce50db8070e8db0798e16ea626606b703d9d0e3ca5b30ff  aiomonitor-0.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256	9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
index 88f28a52dd..4cd7254bdd 100644
--- a/package/python-aiomonitor/python-aiomonitor.mk
+++ b/package/python-aiomonitor/python-aiomonitor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOMONITOR_VERSION = 0.4.3
+PYTHON_AIOMONITOR_VERSION = 0.4.4
 PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
-PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/11/27/2d25a3318e57181e04d2694768f0e1e621b64606d8424076790caa29e401
+PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/fe/15/ac345a2a55ef106b466347c58ebc5f77ef491aea5a05f700e80a181cda47
 PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
 PYTHON_AIOMONITOR_LICENSE = Apache-2.0
 PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
