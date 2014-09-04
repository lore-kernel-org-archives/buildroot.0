From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Sep 2014 17:25:40 +0200
Subject: [Buildroot] [git commit] package/minidlna: Bump version to 1.1.4
Message-ID: <20140904152909.B3E619D5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bf9856f3dd582baa8d5bc7fcd8f4177ca29698f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/minidlna.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 13d65d6..aa2459b 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.1.3
+MINIDLNA_VERSION = 1.1.4
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPLv2 BSD-3c
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
