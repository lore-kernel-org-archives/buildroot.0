From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Oct 2017 22:07:47 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] support/kconfig: fix
	usage typo and align verb tenses
Message-ID: <20171015200943.D526580467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79da53917e9bb05b21db99744900232d48358374
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fix typo 'selectes' -> 'selects'.
Additionally, change 'will exclude' to 'excludes' to align with 'selects'.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 787f4fee7184e4b86343a1d6d60c303622d458b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/kconfig/mconf.c                                      | 2 +-
 support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/kconfig/mconf.c b/support/kconfig/mconf.c
index 7d6cf80..91c4df7 100644
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
index ecfe76b..e76198a 100644
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
