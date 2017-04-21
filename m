From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 21 Apr 2017 11:24:50 -0400
Subject: [Buildroot] [PATCH 5/7] xenomai.mk: fix expected indent with tabs.
In-Reply-To: <20170421152452.11236-1-aduskett@codeblue.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
Message-ID: <20170421152452.11236-5-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/xenomai/xenomai.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 2d92e91..4844fff 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -136,9 +136,9 @@ endef
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_SKINS
 
 define XENOMAI_DEVICES
-/dev/rtheap  c  666  0  0  10  254  0  0  -
-/dev/rtscope c  666  0  0  10  253  0  0  -
-/dev/rtp     c  666  0  0  150 0    0  1  32
+	/dev/rtheap  c  666  0  0  10  254  0  0  -
+	/dev/rtscope c  666  0  0  10  253  0  0  -
+	/dev/rtp     c  666  0  0  150 0    0  1  32
 endef
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-- 
2.9.3
