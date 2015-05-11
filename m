From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 09:01:50 +0200
Subject: [Buildroot] [git commit] package/mono: fixing mono version
Message-ID: <20150511070533.C7B40819BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd31e75c0935b375a3a9b090214a37f6092d7d8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes to the correct mono version 4.0.0 as stated on
the download page.

Fixes:
http://autobuild.buildroot.net/results/227/227f942107e4fcbc14bb1e7d97e1e2758d6f3f2d/

[Peter: add autobuilder reference]
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mono/mono.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index c0a0827..63026f1 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.0.1
+MONO_VERSION = 4.0.0
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
