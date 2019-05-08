From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 09:16:30 +0200
Subject: [Buildroot] [git commit] package/wireshark: replace utf-8 space by
 ascii character
Message-ID: <20190508073739.AB04283B6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a271bbe003efdccbbb4da7c4de3ddfbcfb62c3c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 0a94a00c09..416b334df6 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -23,8 +23,8 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
-	select BR2_PACKAGE_QT5BASE_FONTCONFIG #??runtime
-	select BR2_PACKAGE_QT5BASE_PNG #??runtime
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
+	select BR2_PACKAGE_QT5BASE_PNG # runtime
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5MULTIMEDIA
 	select BR2_PACKAGE_QT5SVG
