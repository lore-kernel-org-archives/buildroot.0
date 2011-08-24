From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Aug 2011 15:07:41 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110824130911.EF0F78C5D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e0a6bcd8268602fe3d2780c23cf5f7be47441ae6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index a6f368b..1e5ea4e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2011.08, Not yet released:
+
+	Fixes all over the tree.
+
+	Toolchain: crosstool-NG 1.12.0, use binutils 2.21 of
+	mips/sh/older uClibc, disallow uClibc 0.9.32 on avr32/sh
+	(broken).
+
+	Updated/fixed packages: barebox, directfb, libsoup,
+	libxml-parser-perl, mtd, python, ti-utils, udev, usbmount,
+	util-linux, xfont_font-misc-misc
+
 2011.08-rc1, Released August 4th, 2011:
 
 	Fixes all over the tree and new features.
-- 
1.7.3.4
