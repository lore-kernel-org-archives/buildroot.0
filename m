From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jul 2015 10:35:29 -0300
Subject: [Buildroot] [PATCH] dejavu: bump to version 2.35
Message-ID: <1436880929-23961-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dejavu/dejavu.hash | 3 +--
 package/dejavu/dejavu.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/dejavu/dejavu.hash b/package/dejavu/dejavu.hash
index df851d7..37868c1 100644
--- a/package/dejavu/dejavu.hash
+++ b/package/dejavu/dejavu.hash
@@ -1,3 +1,2 @@
 # From http://dejavu-fonts.org/wiki/Download
-md5 161462de16e2ca79873bc2b0d2e6c74c dejavu-fonts-ttf-2.34.tar.bz2
-sha256 d0a72c3ae99f5b8d7470daf091ec43f78dc942795aed5c996ab1aa678702eb5d dejavu-fonts-ttf-2.34.tar.bz2
+sha256	f6d7965586101ff3a8a5c3ec503e082bb6a9604ff53413e10702e5917c194d88	dejavu-fonts-ttf-2.35.tar.bz2
diff --git a/package/dejavu/dejavu.mk b/package/dejavu/dejavu.mk
index 65659c3..3dbcc94 100644
--- a/package/dejavu/dejavu.mk
+++ b/package/dejavu/dejavu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEJAVU_VERSION = 2.34
+DEJAVU_VERSION = 2.35
 DEJAVU_SITE = http://sourceforge.net/projects/dejavu/files/dejavu/$(DEJAVU_VERSION)
 DEJAVU_SOURCE = dejavu-fonts-ttf-$(DEJAVU_VERSION).tar.bz2
 DEJAVU_LICENSE_FILES = LICENSE
-- 
2.3.6
