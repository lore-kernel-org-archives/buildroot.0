From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Apr 2016 22:09:03 +0200
Subject: [Buildroot] [git commit] package/exim: bump version to 4.87
Message-ID: <20160408201246.DD0BB7FD6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb5e6738ef4c396b21fa43299fb8d94ef4a42f3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 8f4338b..83be731 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	7756deafd0583776e091f2efcba9b36203e668cf420d8876f314980803636eb3	exim-4.86.2.tar.bz2
+# Locally calculated
+sha256	74691e0dff4d1b5d387e9c33c86f96a8f6d2adbc781c0dec9d2061a847b07dc9	exim-4.87.tar.bz2
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 6a6bb7c..2cc706c 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.86.2
+EXIM_VERSION = 4.87
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
