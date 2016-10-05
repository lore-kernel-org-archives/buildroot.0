From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:51 +0200
Subject: [Buildroot] [git commit] package/python-pygments: bump version to
	2.1.3
Message-ID: <20161005210758.C8E647F952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b46805c08e6fcc8acc408f522048baa46589b82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pygments/python-pygments.hash | 6 +++---
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index bb954dd..2af1597 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=84533d22f72de894f6d3907c3ca9eddf, sha256 locally computed.
-md5	84533d22f72de894f6d3907c3ca9eddf  Pygments-2.1.tar.gz
-sha256	13a0ef5fafd7b16cf995bc28fe7aab0780dab1b2fda0fc89e033709af8b8a47b  Pygments-2.1.tar.gz
+# md5 from https://pypi.python.org/pypi/pygments/json, sha256 locally computed
+md5	ed3fba2467c8afcda4d317e4ef2c6150  Pygments-2.1.3.tar.gz
+sha256	88e4c8a91b2af5962bfa5ea2447ec6dd357018e86e94c7d14bd8cacbc5b55d81  Pygments-2.1.3.tar.gz
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index eafd775..16ed90d 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.1
+PYTHON_PYGMENTS_VERSION = 2.1.3
 PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = http://pypi.python.org/packages/source/P/Pygments
+PYTHON_PYGMENTS_SITE = https://pypi.python.org/packages/b8/67/ab177979be1c81bc99c8d0592ef22d547e70bb4c6815c383286ed5dec504
 PYTHON_PYGMENTS_LICENSE = BSD-2c
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_SETUP_TYPE = setuptools
