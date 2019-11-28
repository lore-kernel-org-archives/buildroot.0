From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 20:12:44 +0100
Subject: [Buildroot] [git commit branch/next] package/python-aiomonitor:
 bump to version 0.4.5
Message-ID: <20191128190512.6F4B681E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f5f9cc4deaa7a6b32c4c8645fad0b93e2eb24ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aiomonitor/python-aiomonitor.hash | 4 ++--
 package/python-aiomonitor/python-aiomonitor.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
index 14a4466ddd..410beb7973 100644
--- a/package/python-aiomonitor/python-aiomonitor.hash
+++ b/package/python-aiomonitor/python-aiomonitor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomonitor/json
-md5	38028c80adf5708ad5f7adadf0fdf404  aiomonitor-0.4.4.tar.gz
-sha256	c3e0d79cb637baa06ce50db8070e8db0798e16ea626606b703d9d0e3ca5b30ff  aiomonitor-0.4.4.tar.gz
+md5	5f184e4b97ea161fc2d690aef604f997  aiomonitor-0.4.5.tar.gz
+sha256	6232c1ab14bf06cd7217845801c27340032f74e283bdaf32d01cdd3b7c673d0e  aiomonitor-0.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256	9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
index 4cd7254bdd..a8860097d5 100644
--- a/package/python-aiomonitor/python-aiomonitor.mk
+++ b/package/python-aiomonitor/python-aiomonitor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOMONITOR_VERSION = 0.4.4
+PYTHON_AIOMONITOR_VERSION = 0.4.5
 PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
-PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/fe/15/ac345a2a55ef106b466347c58ebc5f77ef491aea5a05f700e80a181cda47
+PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/98/76/b62e9fbe267287527fb6f4b6774394d4f00650195774173bb0055a99ab3d
 PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
 PYTHON_AIOMONITOR_LICENSE = Apache-2.0
 PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
