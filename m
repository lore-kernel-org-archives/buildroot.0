From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:57:49 +0100
Subject: [Buildroot] [git commit] xfont_encodings: add missing
	xutil_util-macros select
Message-ID: <20151219145753.6832C81E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e527fcc91ebf0e723c4558e3da68c137d4ab1488
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xfont_encodings/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xfont_encodings/Config.in b/package/x11r7/xfont_encodings/Config.in
index af40da1..d771ffb 100644
--- a/package/x11r7/xfont_encodings/Config.in
+++ b/package/x11r7/xfont_encodings/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_ENCODINGS
 	bool "encodings"
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  No description available
