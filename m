From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 20 Jan 2015 22:00:24 +0100
Subject: [Buildroot] [PATCH] mono: bump to version 3.12.0
Message-ID: <1421787624-6841-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumos version of mono to the latest 3.12.0

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 3d50ac1..0bbf338 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MONO_VERSION = 3.10.0
+MONO_VERSION = 3.12.0
 MONO_SITE = http://download.mono-project.com/sources/mono/
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
-- 
1.9.1
