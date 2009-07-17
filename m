From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 11:23:02 +0200
Subject: [Buildroot] [PATCH 1/1] directfb: bump version
In-Reply-To: <cover.1247822579.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247822579.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5cfe019120097f206545ae4694e9358a0adb75bd.1247822579.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the version of Direct FB to 1.4.1. Fixes bug #467. Thanks to
Lionel Landwerlin <lionel.landwerlin@openwide.fr> for the
notification.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/directfb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 2826615..93b4593 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR:=1.4
-DIRECTFB_VERSION:=1.4.0
+DIRECTFB_VERSION:=1.4.1
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = NO
-- 
1.6.0.4
