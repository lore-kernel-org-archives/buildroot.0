From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:33:43 +0200
Subject: [Buildroot] [git commit] package/python-pydal: bump to version
	v15.07
Message-ID: <20150726163348.2F1DC81942@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=896204d28bdf643cb7e736b16ee24c816bf78147
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps python-pydal to version v15.07.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pydal/python-pydal.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index a99b61e..4c5da41 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = v15.03
+PYTHON_PYDAL_VERSION = v15.07
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3c
 PYTHON_PYDAL_LICENSE_FILES = LICENSE
