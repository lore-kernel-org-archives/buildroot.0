From: Martin Kepplinger <martink@posteo.de>
Date: Tue,  3 Oct 2017 08:21:03 +0200
Subject: [Buildroot] [PATCH v2] x11r7: xdriver_xf86-input-tslib: add the
	hash for the COPYING license file
Message-ID: <20171003062103.22951-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The COPYING file is part of the xf86-input-tslib project's source tree.
Let's include the hash for it's current version.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---

 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
index faff5d4798..d2c1d8ed6d 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
@@ -1,2 +1,5 @@
 # https://github.com/merge/xf86-input-tslib/releases/download/1.1.1/xf86-input-tslib-1.1.1.tar.bz2.sha256
 sha256 8b6a9f2ad73598a3619e66e252bd54b1792c4deba0213101fa4d272b5e9217ec  xf86-input-tslib-1.1.1.tar.bz2
+
+# Locally computed
+sha256  edfc46c9b91499699fc54d39e986756a2dcce8a919c6066be177123441532856  COPYING
-- 
2.11.0
