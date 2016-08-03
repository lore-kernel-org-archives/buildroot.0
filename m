From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  3 Aug 2016 23:26:55 +0200
Subject: [Buildroot] [PATCH] package/mono: bump to version 4.4.2.11
Message-ID: <1470259615-30748-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps mono to version 4.4.2.11

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.hash | 2 +-
 package/mono/mono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index ea358d5..c275e15 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 165e7686b5cbb1ab671b4cb2069207999c3d70044002190b6ec84bb1fdf62b4a  mono-4.4.1.0.tar.bz2
+sha256 900c2cc25ee55adeec04e1ae889316efc127c82cc0c392f928421f19f8f5b633  mono-4.4.2.11.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index f2d36ff..3d0b9bc 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.4.1.0
+MONO_VERSION = 4.4.2.11
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
-- 
1.9.1
