From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:50:15 +0200
Subject: [Buildroot] [git commit] package/xenomai: properly indent
	XENOMAI_DEVICES variable
Message-ID: <20170422135132.ECC888223B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58dd42a59a963f05123e50a594ea4b82d1571733
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
