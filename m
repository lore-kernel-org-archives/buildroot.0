From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 21:16:01 +0200
Subject: [Buildroot] [git commit] package/python-txtorcon: bump to version
 19.1.0
Message-ID: <20191018191756.3BB28826FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=716d6b64d7793c4031787f0a66a7452652754595
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And fix alignment on hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-txtorcon/python-txtorcon.hash | 6 +++---
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index ffc4e8379c..803933f1e6 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txtorcon/json
-md5	7e6ef4d29c2cc51e85614cd2d57bf8df  txtorcon-19.0.0.tar.gz
-sha256	3731b740653e3f551412744f1fcd7fa6f04aa9fa37c90dc6c9152e619886bf3b  txtorcon-19.0.0.tar.gz
+md5	fb323f9874298a8145dbe8d43c387932  txtorcon-19.1.0.tar.gz
+sha256	25d8e52c3eac45bb90ff958ca7cdd7674fb3284e3a50826a58ab7b9578b15ea5  txtorcon-19.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256 3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
+sha256	3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index 7bf1c252b9..a01c0b2511 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 19.0.0
+PYTHON_TXTORCON_VERSION = 19.1.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/b7/93/e16d8160bac3a19d13c9ead9ac6b38f837f2534d40884109a334be1f849c
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/8c/26/d5b2fba4ffbcb23957ff2cee4d7d0a2d667372b9eb04807058bd561c8e8f
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
