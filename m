From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 22:45:09 +0100
Subject: [Buildroot] [git commit] luv: remove the default value of the
	$(PKG)_SOURCE variable
Message-ID: <20151102214515.EF6C98013F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2dd6cd2575e7767a502c2ae4f15785bcc088214
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Acked-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luv/luv.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index fd5c365..a810c63 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LUV_VERSION = 1.7.4-4
-LUV_SOURCE = luv-$(LUV_VERSION).tar.gz
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
