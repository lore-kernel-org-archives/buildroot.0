From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 09:08:22 +0100
Subject: [Buildroot] [git commit] gob2: bump to version 2.0.20
Message-ID: <20140116081740.4D5D79C50B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b9a268f29af8283c789bf68f7fc3b98c5ec747e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gob2/gob2.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 58d0c60..e4f1396 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-GOB2_VERSION = 2.0.19
+GOB2_VERSION = 2.0.20
+GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.xz
 GOB2_SITE = http://ftp.5z.com/pub/gob
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkgconf host-flex
 HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
