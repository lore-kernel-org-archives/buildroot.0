From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:06:31 +0200
Subject: [Buildroot] [git commit] package/freerdp: bump version
Message-ID: <20150404130646.930E3818CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa3f6a2ec0ab4402c60baa3de8cf4c566a5b45f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Little bump to get small bug fixes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index f73bdd7..c7c933e 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Changeset on the stable-1.1 branch
-FREERDP_VERSION = b21ff842ef3de5837513042dc30488b12bd9cf9d
+FREERDP_VERSION = 770c67d340d5f0a7b48d53a1ae0fc23aff748fc4
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = openssl zlib
 FREERDP_LICENSE = Apache-2.0
