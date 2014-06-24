From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:38 -0300
Subject: [Buildroot] [PATCH 32/54] python-pygame: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-32-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-pygame/python-pygame.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
1.8.5.5
