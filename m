From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Nov 2013 12:21:41 +0100
Subject: [Buildroot] [git commit] trivial: pcmanfm: fix typo in config help
Message-ID: <20131107112412.C08F79A527@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c74f17754a989b642ecc4b4a20af6e528bd5c8cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcmanfm/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 42088d6..635aa61 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -8,8 +8,8 @@ config BR2_PACKAGE_PCMANFM
 	select BR2_PACKAGE_XLIB_LIBX11
 	depends on BR2_PACKAGE_LIBGTK2
 	help
-	  An extremly fast and lightweight file manager which features
-	  tabbed browsing and user-friendly interface.
+	  An extremely fast and lightweight file manager which features
+	  tabbed browsing and a user-friendly interface.
 
 	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 
