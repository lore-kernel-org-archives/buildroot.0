From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:13:12 -0400
Subject: [Buildroot] [PATCH 15/17] psmisc: add license info
Message-ID: <1344715992-9883-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/psmisc/psmisc.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index a70f071..cd381e5 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -6,6 +6,8 @@
 
 PSMISC_VERSION = 22.16
 PSMISC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/psmisc/psmisc
+PSMISC_LICENSE = GPLv2
+PSMISC_LICENSE_FILES = COPYING
 PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
-- 
1.7.9.5
