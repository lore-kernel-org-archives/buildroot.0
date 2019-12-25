From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:34:11 +0100
Subject: [Buildroot] [git commit branch/2019.11.x]
 package/qt5/qt5virtualkeyboard: add an upstream URL to Config.in
Message-ID: <20191225212549.4D4F08E451@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f0063db0a5523db0be113e71600bfa3c8905e90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 77c7fa95399b25e9a5ff50324ffca735ee335ea6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5virtualkeyboard/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
index 3a60c27332..8e9cacd3c8 100644
--- a/package/qt5/qt5virtualkeyboard/Config.in
+++ b/package/qt5/qt5virtualkeyboard/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_QT5VIRTUALKEYBOARD
 	  consists of a C++ backend supporting custom input methods as
 	  well as a UI frontend implemented in QML.
 
+	  https://doc.qt.io/qt-5/qtvirtualkeyboard-index.html
+
 if BR2_PACKAGE_QT5VIRTUALKEYBOARD
 
 config BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS
