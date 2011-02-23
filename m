From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Feb 2011 16:25:55 +0100
Subject: [Buildroot] [git commit master 1/1] docs: make xconfig now uses
	libqt4
Message-ID: <20110223152635.79C128F662@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=41300afd629ebda95945fbb944d68a4983c5bfbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 352962d..c2d01e7 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -160,13 +160,13 @@
  $ make gconfig
 </pre>
 
-    <p>to run the Qt3 or GTK-based configurators.</p>
+    <p>to run the Qt or GTK-based configurators.</p>
 
     <p>All of these "make" commands will need to build a configuration
     utility, so you may need to install "development" packages for relevant
     libraries used by the configuration utilities. On Debian-like systems,
     the <code>libncurses5-dev</code> package is required to use the <i>
-    menuconfig</i> interface, <code>libqt3-mt-dev</code> is required to use
+    menuconfig</i> interface, <code>libqt4-dev</code> is required to use
     the <i>xconfig</i> interface, and <code>libglib2.0-dev, libgtk2.0-dev
     and libglade2-dev</code> are needed to use the <i>gconfig</i> interface.</p>
 
-- 
1.7.3.4
