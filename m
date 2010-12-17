From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] barebox: bump Barebox to 2010.11
Message-ID: <20101217160200.2EB878E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=913b7d3d6ff43b626d94749cd530c0f5958bfd15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 85224ca..5bf272a 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BAREBOX_VERSION:=2010.05.0
+BAREBOX_VERSION:=2010.11.0
 BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE:=http://www.barebox.org/download/
 BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
-- 
1.7.2.2
