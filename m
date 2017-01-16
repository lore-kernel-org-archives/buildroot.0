From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 16 Jan 2017 22:14:54 +0100
Subject: [Buildroot] [PATCH] package/mono: bump to version 4.6.2.16
Message-ID: <1484601294-14853-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps mono to version 4.6.2.16

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.hash | 2 +-
 package/mono/mono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 4d05458..6719fec 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 2981f518cace63bfe10953fecd57c7fef040077a1ac617967dde5466062c1327  mono-4.6.0.245.tar.bz2
+sha256 8965d107f4ebf4583ba1b50e0dcad39f0dc6adac8df7a083e9c5879ad93c0ea4  mono-4.6.2.16.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index ea4a7f1..20b9205 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.6.0.245
+MONO_VERSION = 4.6.2.16
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), MIT (libs) or commercial
-- 
2.7.4
