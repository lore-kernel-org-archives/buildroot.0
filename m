From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 13:49:13 +0200
Subject: [Buildroot] [git commit] python-pygame: add license information
Message-ID: <20140626115219.26C139CF05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=962918029105e32d8c00935cb70d572f233ef9cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pygame/python-pygame.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 2278a5c..51f1c20 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -7,10 +7,12 @@
 # stable 1.9.1 release requires V4L which has been wiped out of recent Linux
 # kernels, so use latest mercurial revision until next stable release is out.
 PYTHON_PYGAME_VERSION = f0bb4a4b365d
-PYTHON_PYGAME_SOURCE  = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
+PYTHON_PYGAME_SOURCE = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
 PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
 PYTHON_PYGAME_SITE_METHOD = hg
 PYTHON_PYGAME_SETUP_TYPE = distutils
+PYTHON_PYGAME_LICENSE = LGPLv2.1+
+PYTHON_PYGAME_LICENSE_FILES = LGPL
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
 PYTHON_PYGAME_OPT_DEPENDS += sdl_image
