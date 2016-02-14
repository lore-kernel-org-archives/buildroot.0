From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 14 Feb 2016 23:03:30 +0100
Subject: [Buildroot] [PATCH 1/2] package/mono: bump to version 4.2.2.30
Message-ID: <1455487411-14605-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps mono to the latest 4.2.2.30 version.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.hash | 2 +-
 package/mono/mono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 001f6be..37e0e8b 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 b7b461fe04375f621d88166ba8c6f1cb33c439fd3e17136460f7d087a51ed792  mono-4.2.1.102.tar.bz2
+sha256 57858cd033be9915d7abdc5158c1faae8fa05757c3b7117cab3d703aa696c56b  mono-4.2.2.30.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 8f99983..e50ef50 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.2.1.102
+MONO_VERSION = 4.2.2.30
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
-- 
1.9.1
