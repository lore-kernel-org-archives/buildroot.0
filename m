From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 21:14:51 +0100
Subject: [Buildroot] [git commit] dhcpcd: bump to version 6.6.4
Message-ID: <20141201104839.A53C57FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e1295017cc20bb8beba993a9a82c85cec58fefb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.hash |    2 +-
 package/dhcpcd/dhcpcd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index c8ae064..851849b 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	879c81febafc95ed9353909b719af765e9925c6cb06226b79da6c0dd176fe89f	dhcpcd-6.6.2.tar.bz2
+sha256	67ba7cfe96089150da8e12badbcc5853daefce39417364887984948bad0a37d0	dhcpcd-6.6.4.tar.bz2
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index c06002f..dc663a8 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.6.2
+DHCPCD_VERSION = 6.6.4
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
