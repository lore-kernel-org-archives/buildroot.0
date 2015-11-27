From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 13:16:03 +0100
Subject: [Buildroot] [git commit branch/next] lttng-tools: bump to version
	2.7.0
Message-ID: <20151127122053.29BF681F8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df25b501a5d17211ac67833a53f636e84511a716
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

0001-Fix-Mark-MI-and-Config-string-declarations-as-extern.patch
is gone with commit 4965f956f3ef47388fb4a1b2f8f504abfe31afe7.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-tools/lttng-tools.hash |    2 +-
 package/lttng-tools/lttng-tools.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index a356911..94e389f 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256  128166445126d76da7d9f42a56dec12716732a1ed697a6cfdf40c9e135384f32  lttng-tools-2.6.0.tar.bz2
+sha256  261d1b60ef0f451be42df70f019b24fda9130372e326e7bdba3e3ffab7ca0c40  lttng-tools-2.7.0.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 0cd381c..efca6d7 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.6.0
+LTTNG_TOOLS_VERSION = 2.7.0
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
