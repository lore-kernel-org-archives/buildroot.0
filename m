From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jan 2018 21:33:06 +0100
Subject: [Buildroot] [git commit] package: lighttpd: bump to version 1.4.48
Message-ID: <20180125205008.D974B7FE76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcb71490b1e87316457fc4717ba06cd6102a23c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.hash | 2 +-
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 36783ff..5d221b3 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,2 +1,2 @@
 # From http://www.lighttpd.net/
-sha256 1c97225deea33eefba6d4158c2cef27913d47553263516bbe9d2e2760fc43a3f  lighttpd-1.4.45.tar.xz
+sha256 0f8ad5aac7529d7b948b9d7e8cd0b4a9e177309d85d6bf6516e28e6e40d74f36  lighttpd-1.4.48.tar.xz
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 97ddfc6..592f547 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).45
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).48
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
