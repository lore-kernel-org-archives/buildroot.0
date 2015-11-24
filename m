From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Nov 2015 17:35:20 +0100
Subject: [Buildroot] [git commit branch/next] xtables-addons: bump to
	version 2.10
Message-ID: <20151124163900.DFA5881E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c849ebe70dc5ba8aa949d066d0fd52cf8574b72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xtables-addons/xtables-addons.hash |    7 ++++---
 package/xtables-addons/xtables-addons.mk   |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index c82f016..be8cb6e 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,4 @@
-# Locally calculated after checking signature file from:
-# http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.9/
-sha256	648f6cd17ba41916df5bb605e617b2f18461090139e67d7cf5c5bd8a04c701b0	xtables-addons-2.9.tar.xz
+# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.10/
+sha1	bc6dcb1eb1328931189f6e73a1a02ef4cc51bc44	xtables-addons-2.10.tar.xz
+# Calculated based on the hash above
+sha256	2a2d92ae924437d757f55514502c6ef3aeccc6106f729c702efe703ad30f4007	xtables-addons-2.10.tar.xz
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 30353a0..66e7386 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 2.9
+XTABLES_ADDONS_VERSION = 2.10
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
