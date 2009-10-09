From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: remove unnecessary comment
Message-ID: <20091009130115.0A19077784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7f541e304778b85a3f9a07c8b3dadb3df5b2d35c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt in buildroot should not depend on dbus installed on build platform,
if so this is (or was) a bug in buildroot.

Looks like that this note is left over from ancient buildroot days,
so remove it.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6fe122c..e7c22c3 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,11 +12,6 @@
 #
 ######################################################################
 
-# BUG: In "OpenSuSE 10.2", dbus.h is at dbus-1.0/dbus/dbus.h
-# instead of at "dbus/dbus.h"
-# (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
-# to fix
-
 QT_VERSION:=4.5.2
 QT_CAT:=$(BZCAT)
 
-- 
1.6.3.3
