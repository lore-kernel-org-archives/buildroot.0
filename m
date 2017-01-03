From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 16:24:18 +0100
Subject: [Buildroot] [git commit] xz: bump to version 5.2.3
Message-ID: <20170103152906.9EDB77FB3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=190ba02f3881b8f6c6a3be1c7080fb883e42774c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xz/xz.hash | 2 +-
 package/xz/xz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index f723f7e..20a4a47 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 6ff5f57a4b9167155e35e6da8b529de69270efb2b4cf3fbabf41a4ee793840b5  xz-5.2.2.tar.bz2
+sha256 fd9ca16de1052aac899ad3495ad20dfa906c27b4a5070102a2ec35ca3a4740c1  xz-5.2.3.tar.bz2
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 5e1d7c6..40adb3d 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.2
+XZ_VERSION = 5.2.3
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
