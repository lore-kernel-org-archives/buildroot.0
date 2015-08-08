From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:46 -0000
Subject: [Buildroot] [git commit branch/next] gptfdisk: bump version 1.0.0
Message-ID: <20150808105636.705A27FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abf422ae0a523ac24bcd07aec6748bc9d2f706bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Aur??lien Chabot <aurelien@chabot.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gptfdisk/gptfdisk.hash |    6 +++---
 package/gptfdisk/gptfdisk.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index 93f7b36..0a72e0d 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/0.8.10/
-md5	9cf4246c181c324bdbd553fe9b348373	gptfdisk-0.8.10.tar.gz
-sha1	1708e232220236b6bdf299b315e9bc2205c01ba5	gptfdisk-0.8.10.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.0/
+md5	2061f917af084215898d4fea04d8388f	gptfdisk-1.0.0.tar.gz
+sha1	97f25db2def1c1939ed3954520bfd9948806d95a	gptfdisk-1.0.0.tar.gz
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index f812376..abfddfb 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 0.8.10
+GPTFDISK_VERSION = 1.0.0
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPLv2+
 GPTFDISK_LICENSE_FILES = COPYING
