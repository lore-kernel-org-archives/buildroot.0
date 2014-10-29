From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 23:22:18 +0100
Subject: [Buildroot] [git commit] python-ipy: bump version
Message-ID: <20141029222440.4538C9D319@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edb430b7d31ba1900cea183ea306a0fb0db60b7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-ipy/python-ipy.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index 178ce85..6773aaf 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_IPY_VERSION = IPy-0.75
+PYTHON_IPY_VERSION = IPy-0.82a
 PYTHON_IPY_SITE = $(call github,haypo,python-ipy,$(PYTHON_IPY_VERSION))
 PYTHON_IPY_LICENSE = BSD-3c
 PYTHON_IPY_LICENSE_FILES = COPYING
