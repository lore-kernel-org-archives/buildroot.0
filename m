From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jan 2014 23:05:37 +0100
Subject: [Buildroot] [git commit] gob2: bump to version 2.0.19
Message-ID: <20140114223534.A57A59C4C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=053f8154b03e860ec55b7a62ce5bbd32a0be8574
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gob2/gob2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 9f6cc3e..58d0c60 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOB2_VERSION = 2.0.18
+GOB2_VERSION = 2.0.19
 GOB2_SITE = http://ftp.5z.com/pub/gob
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkgconf host-flex
 HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
