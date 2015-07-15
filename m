From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 15 Jul 2015 12:51:26 +0200
Subject: [Buildroot] [PATCH] package/mono: bump to version 4.0.2.5
Message-ID: <1436957486-10937-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps mono to version 4.0.2.5

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.hash | 2 +-
 package/mono/mono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index c1d0c6e..cf8e0d5 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 4485d8b44a939bef64b3b1b6a7f0388761cfe6803e149aa1e56aab023cfb267e  mono-4.0.0.tar.bz2
+sha256 b074584eea5bbaaf29362486a69d70abe53d0d2feb334f231fa9c841cf6fd651  mono-4.0.2.5.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 63026f1..9cb8564 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.0.0
+MONO_VERSION = 4.0.2.5
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
-- 
1.9.1
