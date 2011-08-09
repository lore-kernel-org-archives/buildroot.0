From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Aug 2011 20:11:11 +0200
Subject: [Buildroot] [git commit] barebox: bump version
Message-ID: <20110809194527.81F2E8B82A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ac7d781f7c6653d08b9044bda786db480a5ed673
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 55e1ffd..5c615f8 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BAREBOX_VERSION = 2011.07.0
+BAREBOX_VERSION = 2011.08.0
 BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE = http://www.barebox.org/download/
 
-- 
1.7.3.4
