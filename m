From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 21:28:59 -0300
Subject: [Buildroot] [PATCH] irssi: security bump to version 0.8.20
Message-ID: <1474763339-20977-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes two remote crash issues since version 0.8.17

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index f65d6c3..33b2d0e 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	4ca0040548e814ea93eb7d602ab7d6d379afcbbdf10e84160523ce69c73ee5d3	irssi-0.8.19.tar.xz
+sha256	7882c4e821f5aac469c5e69e69d7e235f4986101285c675e81a9a95bfb20505a	irssi-0.8.20.tar.xz
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index a1e278e..0fb6fc7 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 0.8.19
+IRSSI_VERSION = 0.8.20
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
-- 
2.7.3
