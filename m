From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 22:45:06 +0100
Subject: [Buildroot] [git commit] luv: fix license typo
Message-ID: <20151102214515.D755B8182A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a61afb85dfb33a38c5887b2632944e243cf74a99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Acked-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luv/luv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 8e108a0..fd5c365 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -8,7 +8,7 @@ LUV_VERSION = 1.7.4-4
 LUV_SOURCE = luv-$(LUV_VERSION).tar.gz
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
-LUV_LICENSE_FILE = LICENSE.txt
+LUV_LICENSE_FILES = LICENSE.txt
 LUV_DEPENDENCIES = libuv
 LUV_INSTALL_STAGING = YES
 
