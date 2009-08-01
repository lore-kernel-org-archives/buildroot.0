From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Aug 2009 01:14:03 +0200
Subject: [Buildroot] [PATCH 1/2] Bump lvm2 to 2.02.50
In-Reply-To: <cover.1249168442.git.thomas.petazzoni@free-electrons.com>
References: <cover.1249168442.git.thomas.petazzoni@free-electrons.com>
Message-ID: <44663da45b71c66d0f7b2e5acec31c9a7de8447d.1249168442.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Daniele Salvatore Albano <daniele@linux-ubuntu-dev.local>

Signed-off-by: Daniele Salvatore Albano <d.albano@gmail.com>
---
 package/lvm2/lvm2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 0cefaba..b3467b5 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -25,7 +25,7 @@
 
 LVM2_BASEVER=2.02
 LVM2_DMVER=1.02
-LVM2_PATCH=47
+LVM2_PATCH=50
 LVM2_VERSION=$(LVM2_BASEVER).$(LVM2_PATCH)
 LVM2_SOURCE:=LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE:=ftp://sources.redhat.com/pub/lvm2
-- 
1.6.0.4
