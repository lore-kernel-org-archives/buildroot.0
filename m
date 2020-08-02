From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2020 22:27:13 +0200
Subject: [Buildroot] [git commit] package/python-six: bump to version 1.15.0
Message-ID: <20200802202326.49A9383962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76e5dd38bd07f1405045ae1bca12d44fc4beb713
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-six/python-six.hash | 6 +++---
 package/python-six/python-six.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-six/python-six.hash b/package/python-six/python-six.hash
index 0d1e75fe9e..9945ffd1d7 100644
--- a/package/python-six/python-six.hash
+++ b/package/python-six/python-six.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/six/json
-md5	21674588a57e649d1a6d977ec3122140  six-1.14.0.tar.gz
-sha256	236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a  six-1.14.0.tar.gz
+md5  9f90a0eaa0ea7747fda01ca79d21ebcb  six-1.15.0.tar.gz
+sha256  30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259  six-1.15.0.tar.gz
 # Locally computed sha256 checksums
-sha256	8bb850c565aa389fdc16f3a46965ad23d82adff60f2393fc2762b63185e8e6c9  LICENSE
+sha256  8bb850c565aa389fdc16f3a46965ad23d82adff60f2393fc2762b63185e8e6c9  LICENSE
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 8acc739f2e..e7621f5ecb 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIX_VERSION = 1.14.0
+PYTHON_SIX_VERSION = 1.15.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
-PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/21/9f/b251f7f8a76dec1d6651be194dfba8fb8d7781d10ab3987190de8391d08e
+PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426
 PYTHON_SIX_SETUP_TYPE = setuptools
 PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
