From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 22:55:03 +0200
Subject: [Buildroot] [git commit] CHANGES: Add missing issues header for
 2019.02.3
Message-ID: <20190902205853.0816888E86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe904511cdb13a3b8d1ccc5ec6d42df2b68884b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 96502c2a46a440926c975711110e387ff226349f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGES b/CHANGES
index c8e13c3bab..ee2f259230 100644
--- a/CHANGES
+++ b/CHANGES
@@ -360,6 +360,8 @@
 	sqlite, subversion, supertux, systemd, tslib, uclibc,
 	v4l2loopback, webkitgtk, woff2
 
+	Issues resolved (http://bugs.uclibc.org):
+
 	#11816: Only selected coreutils binaries are installed
 	#11841: grub-efi.cfg not used when building EFI disk image
 	#11911: systemd v240 memory leak in systemd-journald
