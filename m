From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Oct 2017 13:51:22 +0200
Subject: [Buildroot] [git commit] package: fix license typos
Message-ID: <20171027114556.3B6727F8A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4f9a69aa3181cbdbf9e1604d1cfc64fb9ec5506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../python-backports-shutil-get-terminal-size.mk                        | 2 +-
 package/python-pathlib2/python-pathlib2.mk                              | 2 +-
 package/python-pickleshare/python-pickleshare.mk                        | 2 +-
 package/python-scandir/python-scandir.mk                                | 2 +-
 package/python-traitlets/python-traitlets.mk                            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
index 68ac9a0..7c24b19 100644
--- a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
+++ b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
@@ -9,6 +9,6 @@ PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SOURCE = backports.shutil_get_terminal
 PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SITE = https://pypi.python.org/packages/ec/9c/368086faa9c016efce5da3e0e13ba392c9db79e3ab740b763fe28620b18b
 PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SETUP_TYPE = setuptools
 PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_LICENSE = MIT
-PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_LICENSE_FILE = LICENSE
+PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
diff --git a/package/python-pathlib2/python-pathlib2.mk b/package/python-pathlib2/python-pathlib2.mk
index db2df91..0116420 100644
--- a/package/python-pathlib2/python-pathlib2.mk
+++ b/package/python-pathlib2/python-pathlib2.mk
@@ -8,7 +8,7 @@ PYTHON_PATHLIB2_VERSION = 2.2.1
 PYTHON_PATHLIB2_SOURCE = pathlib2-$(PYTHON_PATHLIB2_VERSION).tar.gz
 PYTHON_PATHLIB2_SITE = https://pypi.python.org/packages/ab/d8/ac7489d50146f29d0a14f65545698f4545d8a6b739b24b05859942048b56
 PYTHON_PATHLIB2_LICENSE = MIT
-PYTHON_PATHLIB2_LICENSE_FILE = LICENSE.rst
+PYTHON_PATHLIB2_LICENSE_FILES = LICENSE.rst
 PYTHON_PATHLIB2_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
diff --git a/package/python-pickleshare/python-pickleshare.mk b/package/python-pickleshare/python-pickleshare.mk
index b2a5e88..53fd84e 100644
--- a/package/python-pickleshare/python-pickleshare.mk
+++ b/package/python-pickleshare/python-pickleshare.mk
@@ -8,7 +8,7 @@ PYTHON_PICKLESHARE_VERSION = 0.7.4
 PYTHON_PICKLESHARE_SOURCE = pickleshare-$(PYTHON_PICKLESHARE_VERSION).tar.gz
 PYTHON_PICKLESHARE_SITE = https://pypi.python.org/packages/69/fe/dd137d84daa0fd13a709e448138e310d9ea93070620c9db5454e234af525
 PYTHON_PICKLESHARE_LICENSE = MIT
-PYTHON_PICKLESHARE_LICENSE_FILE = LICENSE
+PYTHON_PICKLESHARE_LICENSE_FILES = LICENSE
 PYTHON_PICKLESHARE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
diff --git a/package/python-scandir/python-scandir.mk b/package/python-scandir/python-scandir.mk
index 2ff8ea2..9b7ba70 100644
--- a/package/python-scandir/python-scandir.mk
+++ b/package/python-scandir/python-scandir.mk
@@ -8,7 +8,7 @@ PYTHON_SCANDIR_VERSION = 1.5
 PYTHON_SCANDIR_SOURCE = scandir-$(PYTHON_SCANDIR_VERSION).tar.gz
 PYTHON_SCANDIR_SITE = https://pypi.python.org/packages/bd/f4/3143e0289faf0883228017dbc6387a66d0b468df646645e29e1eb89ea10e
 PYTHON_SCANDIR_LICENSE = BSD-3-Clause
-PYTHON_SCANDIR_LICENSE_FILE = LICENSE.txt
+PYTHON_SCANDIR_LICENSE_FILES = LICENSE.txt
 PYTHON_SCANDIR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index c711bde..779f593 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -8,7 +8,7 @@ PYTHON_TRAITLETS_VERSION = 4.3.2
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
 PYTHON_TRAITLETS_SITE = https://pypi.python.org/packages/a5/98/7f5ef2fe9e9e071813aaf9cb91d1a732e0a68b6c44a32b38cb8e14c3f069
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
-PYTHON_TRAITLETS_LICENSE_FILE = COPYING.md
+PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
 PYTHON_TRAITLETS_SETUP_TYPE = distutils
 
 $(eval $(python-package))
