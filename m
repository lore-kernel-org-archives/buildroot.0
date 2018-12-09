From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 22:50:12 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5virtualkeyboard: rewrap
 Config.in help text
Message-ID: <20181209214700.8165C86BFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88b2e747dfa7e562001b0c959b3b1c1a2b3717ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package complains with:

package/qt5/qt5virtualkeyboard/Config.in:59: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

So let's rewrap the Config.in help text.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5virtualkeyboard/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
index c3f2f37604..3a60c27332 100644
--- a/package/qt5/qt5virtualkeyboard/Config.in
+++ b/package/qt5/qt5virtualkeyboard/Config.in
@@ -56,6 +56,7 @@ config BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING
 config BR2_PACKAGE_QT5VIRTUALKEYBOARD_ARROW_KEY_NAVIGATION
 	bool "Arrow key navigation"
 	help
-	  Allows controlling the keyboard using the arrow and return keys.
+	  Allows controlling the keyboard using the arrow and return
+	  keys.
 
 endif
