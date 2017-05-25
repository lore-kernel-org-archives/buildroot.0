From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 May 2017 00:21:59 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/dejavu: bump version to 2.37
Message-ID: <20170525222159.17061-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed _SITE to https, fixed broken hash url.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dejavu/dejavu.hash | 4 ++--
 package/dejavu/dejavu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dejavu/dejavu.hash b/package/dejavu/dejavu.hash
index 37868c13d..db7365a1c 100644
--- a/package/dejavu/dejavu.hash
+++ b/package/dejavu/dejavu.hash
@@ -1,2 +1,2 @@
-# From http://dejavu-fonts.org/wiki/Download
-sha256	f6d7965586101ff3a8a5c3ec503e082bb6a9604ff53413e10702e5917c194d88	dejavu-fonts-ttf-2.35.tar.bz2
+# From https://dejavu-fonts.github.io/Download.html
+sha256 fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7  dejavu-fonts-ttf-2.37.tar.bz2
diff --git a/package/dejavu/dejavu.mk b/package/dejavu/dejavu.mk
index 3dbcc94e1..9b57f0992 100644
--- a/package/dejavu/dejavu.mk
+++ b/package/dejavu/dejavu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DEJAVU_VERSION = 2.35
-DEJAVU_SITE = http://sourceforge.net/projects/dejavu/files/dejavu/$(DEJAVU_VERSION)
+DEJAVU_VERSION = 2.37
+DEJAVU_SITE = https://sourceforge.net/projects/dejavu/files/dejavu/$(DEJAVU_VERSION)
 DEJAVU_SOURCE = dejavu-fonts-ttf-$(DEJAVU_VERSION).tar.bz2
 DEJAVU_LICENSE_FILES = LICENSE
 
-- 
2.11.0
