From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:27:26 +0200
Subject: [Buildroot] [git commit] package: use SPDX short identifier for
	Apache version 2
Message-ID: <20170401134425.9B117825F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=169cf1f9acbf1eb6b07f030a3ca676a8e796e232
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for Apache version 2 license is Apache-2.0.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flickcurl/flickcurl.mk       | 2 +-
 package/pdbg/pdbg.mk                 | 2 +-
 package/python-pyrex/python-pyrex.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
index 0e194e6..610b81f 100644
--- a/package/flickcurl/flickcurl.mk
+++ b/package/flickcurl/flickcurl.mk
@@ -6,7 +6,7 @@
 
 FLICKCURL_VERSION = 1.26
 FLICKCURL_SITE = http://download.dajobe.org/flickcurl
-FLICKCURL_LICENSE = LGPL-2.1+ or GPL-2.0+ or Apache 2.0+
+FLICKCURL_LICENSE = LGPL-2.1+ or GPL-2.0+ or Apache-2.0+
 FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
 FLICKCURL_INSTALL_STAGING = YES
 FLICKCURL_CONFIG_SCRIPTS = flickcurl-config
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 9cc05cd..184de86 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -6,7 +6,7 @@
 
 PDBG_VERSION = 90a7370a11e727f1482dea6ff2bd6aec20c64805
 PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
-PDBG_LICENSE = Apache 2.0
+PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
 PDBG_AUTORECONF = YES
 
diff --git a/package/python-pyrex/python-pyrex.mk b/package/python-pyrex/python-pyrex.mk
index 6ddb2dc..6284a5f 100644
--- a/package/python-pyrex/python-pyrex.mk
+++ b/package/python-pyrex/python-pyrex.mk
@@ -7,7 +7,7 @@
 PYTHON_PYREX_VERSION = 0.9.9
 PYTHON_PYREX_SOURCE = Pyrex-$(PYTHON_PYREX_VERSION).tar.gz
 PYTHON_PYREX_SITE = http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex
-PYTHON_PYREX_LICENSE = Apache-v2
+PYTHON_PYREX_LICENSE = Apache-2.0
 PYTHON_PYREX_LICENSE_FILES = LICENSE.txt
 PYTHON_PYREX_SETUP_TYPE = distutils
 HOST_PYTHON_PYREX_NEEDS_HOST_PYTHON = python2
