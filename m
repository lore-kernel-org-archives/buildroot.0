From: Martin Kepplinger <martink@posteo.de>
Date: Mon,  2 Oct 2017 15:12:45 +0200
Subject: [Buildroot] [PATCH] x11r7: xdriver_xf86-input-tslib: add the hash
	for the COPYING license file
Message-ID: <20171002131245.6056-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the hash for the COPYING file. It is part of the project's source tree.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
index faff5d4798..ebf1671e76 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
@@ -1,2 +1,5 @@
 # https://github.com/merge/xf86-input-tslib/releases/download/1.1.1/xf86-input-tslib-1.1.1.tar.bz2.sha256
 sha256 8b6a9f2ad73598a3619e66e252bd54b1792c4deba0213101fa4d272b5e9217ec  xf86-input-tslib-1.1.1.tar.bz2
+
+# Locally computed
+sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
-- 
2.11.0
