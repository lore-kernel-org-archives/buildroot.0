From: Rodrigo Rebello <rprebello@gmail.com>
Date: Thu, 11 Aug 2016 22:00:14 -0300
Subject: [Buildroot] [PATCH 1/1] irssi: bump to version 0.8.19
Message-ID: <1470963614-19423-1-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index fa49d85..f65d6c3 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	c0a177f749757c2d171ebe49ab0f0dd9cf9374dea81ab01904d0549bcb057840	irssi-0.8.18.tar.xz
+sha256	4ca0040548e814ea93eb7d602ab7d6d379afcbbdf10e84160523ce69c73ee5d3	irssi-0.8.19.tar.xz
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 8272e44..a1e278e 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 0.8.18
+IRSSI_VERSION = 0.8.19
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
-- 
2.1.4
