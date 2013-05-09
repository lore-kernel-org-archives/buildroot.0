From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 17:51:07 +0200
Subject: [Buildroot] [PATCH 12/12] pixman: add license informations
In-Reply-To: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368114667-14476-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pixman/pixman.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 607f82e..c2ee035 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -5,6 +5,9 @@
 ################################################################################
 PIXMAN_VERSION = 0.28.2
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
+PIXMAN_LICENSE = MIT
+PIXMAN_LICENSE_FILES = COPYING
+
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkgconf
 # don't build gtk based demos
-- 
1.7.9.5
