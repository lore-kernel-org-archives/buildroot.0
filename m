From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 16:48:56 +0100
Subject: [Buildroot] [git commit] libgtk2: remove redundant INSTALL_TARGET
Message-ID: <20150114154902.16FF580142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33d7aad9f35f027173f08c9bcfd8fc4a6bc90686
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

INSTALL_TARGET defaults to YES.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index eeb56f5..dfc1f5b 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -10,7 +10,6 @@ LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).18
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
-LIBGTK2_INSTALL_TARGET = YES
 LIBGTK2_LICENSE = LGPLv2+
 LIBGTK2_LICENSE_FILES = COPYING
 
