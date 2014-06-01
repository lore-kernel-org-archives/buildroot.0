From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:39 +0200
Subject: [Buildroot] [PATCH 15/26] package/snappy: bump version
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <5268e3a0905fab8c1a5c8f547fb96bea44e93ec2.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This is the un-tagged 1.1.2 release.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/snappy/snappy.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index c30cb3c..6d20df8 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.1.1
-SNAPPY_SITE = http://snappy.googlecode.com/files/
+SNAPPY_VERSION = 1ff9be9b8fafc8528ca9e055646f5932aa5db9c4
+SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3c
 SNAPPY_LICENSE_FILES = COPYING
 SNAPPY_INSTALL_STAGING = YES
-- 
1.8.3.2
