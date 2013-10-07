From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 22:08:42 +0200
Subject: [Buildroot] [git commit] lighttpd: Version bump to 1.4.33
Message-ID: <20131007201927.EB1D49B978@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38cde8594dcacb8d1e7460e7eab4e70ef9ecb464
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index f65ee6d..c820a73 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIGHTTPD_VERSION = 1.4.32
+LIGHTTPD_VERSION = 1.4.33
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
 LIGHTTPD_LICENSE = BSD-3c
