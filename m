From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 23:21:54 +0100
Subject: [Buildroot] [git commit] python-configshell-fb: Bump version
Message-ID: <20141029222440.3C6FCB20A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43bcd336c00ebab5ff7e5d42a6fc07bf931b9140
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python-configshell-fb/python-configshell-fb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index 64b27fe..76ef48d 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CONFIGSHELL_FB_VERSION = v1.1.fb14
+PYTHON_CONFIGSHELL_FB_VERSION = v1.1.fb15
 PYTHON_CONFIGSHELL_FB_SITE = $(call github,agrover,configshell-fb,$(PYTHON_CONFIGSHELL_FB_VERSION))
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
