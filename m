From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2016 11:22:58 +0200
Subject: [Buildroot] [git commit] ifupdown: bump to version 0.8.16
Message-ID: <20161011092323.DBCEF82266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f962221f0e73f6dff69686282b265aa52b04673d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifupdown/ifupdown.hash | 4 ++--
 package/ifupdown/ifupdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ifupdown/ifupdown.hash b/package/ifupdown/ifupdown.hash
index 5f59d28..01353c6 100644
--- a/package/ifupdown/ifupdown.hash
+++ b/package/ifupdown/ifupdown.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.13.dsc
-sha256	90938bf6a2bb31b0ed4d8b2be71beb909c334af64c9284b3f50820cbaeff49b6	ifupdown_0.8.13.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.16.dsc
+sha256	601416c12e39ac29022951a2867aed5c607f732ac57fd51517bfba92a4cc4fb0	ifupdown_0.8.16.tar.xz
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index 156496b..ad0e513 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-IFUPDOWN_VERSION = 0.8.13
+IFUPDOWN_VERSION = 0.8.16
 IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
-IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160604T232714Z/pool/main/i/ifupdown
+IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160922T165503Z/pool/main/i/ifupdown
 IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 IFUPDOWN_LICENSE = GPLv2+
 IFUPDOWN_LICENSE_FILES = COPYING
