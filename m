From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2021 20:13:00 +0100
Subject: [Buildroot] [git commit branch/next] package/faketime: bump to
 version 0.9.9
Message-ID: <20210225185109.E0E238648B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81efd0da9ab7d391ba18b4663679cfd17cc6dd24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update indentation in hash file (two spaces)

https://github.com/wolfcw/libfaketime/releases/tag/v0.9.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/faketime/faketime.hash | 4 ++--
 package/faketime/faketime.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/faketime/faketime.hash b/package/faketime/faketime.hash
index bdb003aa69..0628ff9ae6 100644
--- a/package/faketime/faketime.hash
+++ b/package/faketime/faketime.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 06288237cd5890eca148489e5b904ed852ed0ffa8424bfb479342f4daa8442a3 faketime-0.9.8.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+sha256  57d0181150361c0a9b5c8eef05b11392f6134ada2c2d998e92e63daed639647c  faketime-0.9.9.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 85ce9a90d8..355477ba3b 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAKETIME_VERSION = 0.9.8
+FAKETIME_VERSION = 0.9.9
 FAKETIME_SITE = $(call github,wolfcw,libfaketime,v$(FAKETIME_VERSION))
 FAKETIME_LICENSE = GPL-2.0
 FAKETIME_LICENSE_FILES = COPYING
