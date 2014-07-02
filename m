From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jul 2014 09:40:11 -0300
Subject: [Buildroot] [PATCH 13/13] dmraid: add license information
In-Reply-To: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404304811-27480-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dmraid/dmraid.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 412c903..612f560 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -12,6 +12,8 @@ DMRAID_SUBDIR = $(DMRAID_VERSION)/dmraid
 DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
 DMRAID_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+DMRAID_LICENSE = GPLv2+, LGPLv2.1
+DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE_LGPL
 
 DMRAID_DEPENDENCIES = lvm2
 
-- 
1.8.5.5
