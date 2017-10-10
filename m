From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue, 10 Oct 2017 10:32:29 +0200
Subject: [Buildroot] [PATCH] support/kconfig: fix usage typo and align verb
	tenses
Message-ID: <20171010083229.GU10849@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix typo 'selectes' -> 'selects'.
Additionally, change 'will exclude' to 'excludes' to align with 'selects'.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---

Note: I bumped into this by accident and couldn't let it sit there.


 support/kconfig/mconf.c                                      | 2 +-
 support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/kconfig/mconf.c b/support/kconfig/mconf.c
index 7d6cf80703..91c4df78f3 100644
--- a/support/kconfig/mconf.c
+++ b/support/kconfig/mconf.c
@@ -176,7 +176,7 @@ menu_instructions[] = N_(
 	"Arrow keys navigate the menu.  "
 	"<Enter> selects submenus ---> (or empty submenus ----).  "
 	"Highlighted letters are hotkeys.  "
-	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
+	"Pressing <Y> selects a feature, while <N> excludes a feature.  "
 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
 	"Legend: [*] feature is selected  [ ] feature is excluded"),
 radiolist_instructions[] = N_(
diff --git a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
index ecfe76b6e2..e76198a36b 100644
--- a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
@@ -28,7 +28,7 @@ Index: kconfig/mconf.c
  	"<Enter> selects submenus ---> (or empty submenus ----).  "
  	"Highlighted letters are hotkeys.  "
 -	"Pressing <Y> includes, <N> excludes, <M> modularizes features.  "
-+	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
++	"Pressing <Y> selects a feature, while <N> excludes a feature.  "
  	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
 -	"Legend: [*] built-in  [ ] excluded  <M> module  < > module capable"),
 +	"Legend: [*] feature is selected  [ ] feature is excluded"),
-- 
2.13.5
