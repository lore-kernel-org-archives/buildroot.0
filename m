From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  7 Jul 2016 22:52:15 +0200
Subject: [Buildroot] [PATCH] package/mono: bump version to 4.4.1.0
Message-ID: <1467924735-11497-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps mono version to the latest released version 4.4.1.0.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.hash | 2 +-
 package/mono/mono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 748a9e1..ea358d5 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 983e27a054bc3dc6709b32b8de45a0f4335e9e9c3911b20d29f63eb7cc00bfe5  mono-4.4.0.182.tar.bz2
+sha256 165e7686b5cbb1ab671b4cb2069207999c3d70044002190b6ec84bb1fdf62b4a  mono-4.4.1.0.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 3104622..f2d36ff 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.4.0.182
+MONO_VERSION = 4.4.1.0
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
-- 
1.9.1
