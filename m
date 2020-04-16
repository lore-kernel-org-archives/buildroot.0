From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Apr 2020 03:56:02 -0600
Subject: [Buildroot] [PATCH 1/1] package/python{,
 3}-mako: bump to version 1.1.2
Message-ID: <20200416095602.91630-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 package/python3-mako/python3-mako.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index a1c18c9916..19b122179e 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5	2660a4916f2f63456e6885c727b7cd2f  Mako-1.1.1.tar.gz
-sha256	2984a6733e1d472796ceef37ad48c26f4a984bb18119bb2dbc37a44d8f6e75a4  Mako-1.1.1.tar.gz
+md5  e1939facb40f38f15e8cc74cb5887c4c  Mako-1.1.2.tar.gz
+sha256  3139c5d64aa5d175dbafb95027057128b5fbd05a40c53999f3905ceb53366d9d  Mako-1.1.2.tar.gz
 # Locally computed sha256 checksums
-sha256	47cd0d41b1092f9161cfb629ed15e5cea185144710ff4633a4281ef088ff5de7  LICENSE
+sha256  47cd0d41b1092f9161cfb629ed15e5cea185144710ff4633a4281ef088ff5de7  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 5be9937fee..ce34321cb1 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python3-mako/python3-mako.mk
-PYTHON_MAKO_VERSION = 1.1.1
+PYTHON_MAKO_VERSION = 1.1.2
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/28/03/329b21f00243fc2d3815399413845dbbfb0745cff38a29d3597e97f8be58
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/42/64/fc7c506d14d8b6ed363e7798ffec2dfe4ba21e14dda4cfab99f4430cba3a
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
diff --git a/package/python3-mako/python3-mako.mk b/package/python3-mako/python3-mako.mk
index 6d5c1a185e..7b135c110c 100644
--- a/package/python3-mako/python3-mako.mk
+++ b/package/python3-mako/python3-mako.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-mako/python-mako.mk
-PYTHON3_MAKO_VERSION = 1.1.1
+PYTHON3_MAKO_VERSION = 1.1.2
 PYTHON3_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON3_MAKO_SITE = https://files.pythonhosted.org/packages/28/03/329b21f00243fc2d3815399413845dbbfb0745cff38a29d3597e97f8be58
+PYTHON3_MAKO_SITE = https://files.pythonhosted.org/packages/42/64/fc7c506d14d8b6ed363e7798ffec2dfe4ba21e14dda4cfab99f4430cba3a
 PYTHON3_MAKO_SETUP_TYPE = setuptools
 PYTHON3_MAKO_LICENSE = MIT
 PYTHON3_MAKO_LICENSE_FILES = LICENSE
-- 
2.20.1
