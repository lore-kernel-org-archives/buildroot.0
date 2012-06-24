From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jun 2012 23:16:34 +0200
Subject: [Buildroot] [PATCH] sound-theme-freedesktop: add host-intltool
	dependency
Message-ID: <1340572594-29547-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/c4e5cad3e4bf08440cea081789b8d58b238d9683/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../sound-theme-freedesktop.mk                     |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sound-theme-freedesktop/sound-theme-freedesktop.mk b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
index d81c207..3a1a162 100644
--- a/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
+++ b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
@@ -8,5 +8,6 @@ SOUND_THEME_FREEDESKTOP_SITE = \
 	http://people.freedesktop.org/~mccann/dist
 SOUND_THEME_FREEDESKTOP_SOURCE = \
 	sound-theme-freedesktop-$(SOUND_THEME_FREEDESKTOP_VERSION).tar.bz2
+SOUND_THEME_FREEDESKTOP_DEPENDENCIES = host-intltool
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.9.5
