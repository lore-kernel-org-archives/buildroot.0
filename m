From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 12:58:00 +0200
Subject: [Buildroot] [git commit branch/next] irssi: bump to version 0.8.19
Message-ID: <20160816110755.63B5C8213C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e44acf092543337b489833b75c50d41cdbf49ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
