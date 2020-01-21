From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2020 21:08:52 +0100
Subject: [Buildroot] [git commit] package/rtl8821au: bump to version 4235b0e
Message-ID: <20200121200043.C316A83647@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae45d78a95e3b8d8544e71b6ab3092e3f0e277ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bump package/rtl8821au to version 4235b0e.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index f35d57910c..ab82f565c0 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 23889fe4bf518dbadcbfac613f64a74bbce177267d9337a98843e4e7de8f1896  rtl8821au-b018b446fb0729fa659e7eead475d6c13f192642.tar.gz
+sha256 9c8e127dcf2b4d87df546f7f51afdbca0a0561cdba9bcc2689722e1090c46204  rtl8821au-4235b0ec7d7220a6364586d8e25b1e8cb99c36f1.tar.gz
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index b6ad431b8b..5f4ba3eb76 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = b018b446fb0729fa659e7eead475d6c13f192642
+RTL8821AU_VERSION = 4235b0ec7d7220a6364586d8e25b1e8cb99c36f1
 RTL8821AU_SITE = $(call github,abperiasamy,rtl8812AU_8821AU_linux,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
