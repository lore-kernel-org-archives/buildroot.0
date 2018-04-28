From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Apr 2018 21:03:27 +0200
Subject: [Buildroot] [PATCH 1/1] libcroco: add hash for license file
Message-ID: <20180428190327.22470-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcroco/libcroco.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcroco/libcroco.hash b/package/libcroco/libcroco.hash
index 83d2ffe515..809671c5ee 100644
--- a/package/libcroco/libcroco.hash
+++ b/package/libcroco/libcroco.hash
@@ -1,2 +1,5 @@
 # From http://ftp.acc.umu.se/pub/gnome/sources/libcroco/0.6/libcroco-0.6.12.sha256sum
 sha256	ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860	libcroco-0.6.12.tar.xz
+
+# Hash for license file:
+sha256	94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23	COPYING.LIB
-- 
2.14.1
