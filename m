From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Oct 2017 14:16:10 +0200
Subject: [Buildroot] [git commit] x11r7: xdriver_xf86-input-tslib: add the
	hash for the COPYING license file
Message-ID: <20171003121608.D994D81028@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43fd1838a07d76bf1a3f8dff6f2fe080da8f8349
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The COPYING file is part of the xf86-input-tslib project's source tree.
Let's include the hash for it's current version.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
index faff5d4..d2c1d8e 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
@@ -1,2 +1,5 @@
 # https://github.com/merge/xf86-input-tslib/releases/download/1.1.1/xf86-input-tslib-1.1.1.tar.bz2.sha256
 sha256 8b6a9f2ad73598a3619e66e252bd54b1792c4deba0213101fa4d272b5e9217ec  xf86-input-tslib-1.1.1.tar.bz2
+
+# Locally computed
+sha256  edfc46c9b91499699fc54d39e986756a2dcce8a919c6066be177123441532856  COPYING
