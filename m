From: Martin Kepplinger <martink@posteo.de>
Date: Mon,  2 Oct 2017 15:12:16 +0200
Subject: [Buildroot] [PATCH] tslib: add the hash for the COPYING license file
Message-ID: <20171002131216.5508-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since tslib's COPYING file in part of the source tree, we can easily
include it's hash for the given version here.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/tslib/tslib.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 3ed49008fb..cca74fc827 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,5 @@
 # https://github.com/kergoth/tslib/releases/download/1.13/tslib-1.13.tar.xz.sha256
 sha256  b381279f2d6ad6acb80cfc4852860853b7bcd1a9440821e9fe920c33f4e4f8da  tslib-1.13.tar.xz
+
+# Locally computed
+sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
-- 
2.11.0
