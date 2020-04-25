From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 22:17:58 +0200
Subject: [Buildroot] [git commit] package/conntrack-tools: bump to version
 1.4.6
Message-ID: <20200425200500.ECD799037A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca08f854d65c6ce851e1248082c468404f946d50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/conntrack-tools/conntrack-tools.hash | 2 +-
 package/conntrack-tools/conntrack-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.hash b/package/conntrack-tools/conntrack-tools.hash
index cd95a06dc1..ae9af25e8f 100644
--- a/package/conntrack-tools/conntrack-tools.hash
+++ b/package/conntrack-tools/conntrack-tools.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/conntrack-tools/downloads.html
-sha256 36c6d99c7684851d4d72e75bd07ff3f0ff1baaf4b6f069eb7244990cd1a9a462  conntrack-tools-1.4.5.tar.bz2
+sha256 590859cc848245dbfd9c6487761dd303b3a1771e007f4f42213063ca56205d5f  conntrack-tools-1.4.6.tar.bz2
 # Locally calculated
 sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 77fcb52956..145b6d785f 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNTRACK_TOOLS_VERSION = 1.4.5
+CONNTRACK_TOOLS_VERSION = 1.4.6
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
