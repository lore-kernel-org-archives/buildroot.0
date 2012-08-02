From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:59 -0000
Subject: [Buildroot] [git commit branch/next] sound-theme-freedesktop: add
	host-intltool dependency
Message-ID: <20120802195245.0B0718C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea6c1b9f12b932dc373b3b58459bc676e17f0e54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes
http://autobuild.buildroot.org/results/c4e5cad3e4bf08440cea081789b8d58b238d9683/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../sound-theme-freedesktop.mk                     |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
