From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Oct 2012 11:21:05 +0200
Subject: [Buildroot] [git commit] vala version update 0.18.0
Message-ID: <20121021191347.2140B9709E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7063985d6fa10ddf04c810b830b9dd9c4b7e6b34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vala/vala.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index e4b8b54..5c333c5 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-VALA_VERSION_MAJOR = 0.17
-VALA_VERSION_MINOR = 7
+VALA_VERSION_MAJOR = 0.18
+VALA_VERSION_MINOR = 0
 VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
