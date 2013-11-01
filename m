From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 15:34:04 +0100
Subject: [Buildroot] [git commit] uemacs: fix package source
Message-ID: <20131104211054.B2B279BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77de13ba5525f4efbfed6e3f30ab5e4b18ca3980
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no bz2 archive for uemacs on kernel.org, only a gz archive.

Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uemacs/uemacs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 9452062..0cd38e0 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UEMACS_VERSION = 4.0.15-lt
-UEMACS_SOURCE = em-$(UEMACS_VERSION).tar.bz2
+UEMACS_SOURCE = em-$(UEMACS_VERSION).tar.gz
 UEMACS_SITE = $(BR2_KERNEL_MIRROR)/software/editors/uemacs/
 UEMACS_DEPENDENCIES = ncurses
 
