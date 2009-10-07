From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:32 +0200
Subject: [Buildroot] [PATCH 09/23] qt: remove unnecessary comment
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-10-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt in buildroot should not depend on dbus installed on build platform,
if so this is (or was) a bug in buildroot.

Looks like that this note is left over from ancient buildroot days,
so remove it.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 85ff9a6..c61d70c 100644
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
