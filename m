From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 14:26:58 +0100
Subject: [Buildroot] [PATCH] docs/manual/prerequisite.txt: 'make xconfig'
 uses Qt5, not Qt4
Message-ID: <20191027132658.23897-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 6eacea5a (support/kconfig: bump to kconfig from Linux
4.17-rc2), xconfig uses Qt5, so update prerequisite.txt to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 1f67e72a24..4e614cfa1b 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -59,7 +59,7 @@ data, which in many distributions are packaged separately. The
 development packages typically have a _-dev_ or _-devel_ suffix.
 +
 ** +ncurses5+ to use the 'menuconfig' interface
-** +qt4+ to use the 'xconfig' interface
+** +qt5+ to use the 'xconfig' interface
 ** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
 
 * Source fetching tools:
-- 
2.20.1
