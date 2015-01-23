From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 21:42:04 +0100
Subject: [Buildroot] [git commit] mono: bump to version 3.12.0
Message-ID: <20150123204619.478A280E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69b32200a623ccb9b7252e1ad8964d8f9b92f1a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps version of mono to the latest 3.12.0

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mono/mono.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
