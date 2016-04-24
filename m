From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 24 Apr 2016 16:15:48 +0200
Subject: [Buildroot] [PATCH] package/mono: bump to version 4.2.3.4
Message-ID: <1461507348-2123-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bump mono version to the latest release 4.2.3.4.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.hash | 2 +-
 package/mono/mono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 37e0e8b..d1277c5 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 57858cd033be9915d7abdc5158c1faae8fa05757c3b7117cab3d703aa696c56b  mono-4.2.2.30.tar.bz2
+sha256 4703d390416a6e9977585f13711f59a6d54431086c2dbacee49888dcc31937be  mono-4.2.3.4.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index e50ef50..0b9cb46 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.2.2.30
+MONO_VERSION = 4.2.3.4
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
-- 
1.9.1
