From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:08:34 +0100
Subject: [Buildroot] [git commit] connman-gtk: bump to version 1.1.1
Message-ID: <20160322220837.53231802B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d12d53e23076ea48cfd50e4e911155dc04a0bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman-gtk/connman-gtk.hash | 2 +-
 package/connman-gtk/connman-gtk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman-gtk/connman-gtk.hash b/package/connman-gtk/connman-gtk.hash
index 034064e..d71e77d 100644
--- a/package/connman-gtk/connman-gtk.hash
+++ b/package/connman-gtk/connman-gtk.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9e9008d40ada97aa20d627b7ad966e9a2ae69afcae3971b1b29a225cf7110e27	connman-gtk-1.1.tar.bz2
+sha256	49bdc4769a7c508b0130e4705eef21aec9df1ea4f5c29fee48a0cae8db828fca	connman-gtk-1.1.1.tar.bz2
diff --git a/package/connman-gtk/connman-gtk.mk b/package/connman-gtk/connman-gtk.mk
index 570c3c8..2c9c131 100644
--- a/package/connman-gtk/connman-gtk.mk
+++ b/package/connman-gtk/connman-gtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_GTK_VERSION = 1.1
+CONNMAN_GTK_VERSION = 1.1.1
 CONNMAN_GTK_SITE = https://github.com/jgke/connman-gtk/releases/download/v$(CONNMAN_GTK_VERSION)
 CONNMAN_GTK_SOURCE = connman-gtk-$(CONNMAN_GTK_VERSION).tar.bz2
 CONNMAN_GTK_INSTALL_STAGING = YES
