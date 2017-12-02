From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 00:00:58 +0100
Subject: [Buildroot] [git commit] lxc: add hash for license file
Message-ID: <20171202230429.6E1AD80FD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=549be936dcce4ca3d59f835e13164a9b3c9ffbd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lxc/lxc.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 8adccaf..d8526e9 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	68663a67450a8d6734e137eac54cc7077209fb15c456eec401a2c26e6386eff6	lxc-2.1.1.tar.gz
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
