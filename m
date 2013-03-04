From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 20:56:47 +0100
Subject: [Buildroot] [git commit] dosfstools: bump to version 3.0.16
Message-ID: <20130304200436.121909AEAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a1fd4be2c849fabb54cf303c2ca753eb9a0314e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dosfstools/dosfstools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index e3cc9cf..3a0856a 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DOSFSTOOLS_VERSION = 3.0.15
+DOSFSTOOLS_VERSION = 3.0.16
 DOSFSTOOLS_SITE = http://fossies.org/linux/misc
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
