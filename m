From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Dec 2012 22:42:26 +0100
Subject: [Buildroot] [git commit] docs/manual: Slightly improve the
	introduction
Message-ID: <20121229214338.29D969A52D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26bc50075dcb9e34c62fa198c32caaae868ee130
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/introduction.txt |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.txt
index 9353f8c..a567cec 100644
--- a/docs/manual/introduction.txt
+++ b/docs/manual/introduction.txt
@@ -3,11 +3,16 @@
 About Buildroot
 ===============
 
-Buildroot provides a full-featured environment for cross-development.
-Buildroot is able to generate a cross-compilation toolchain, a root
-filesystem, a Linux kernel image and a bootloader for your target.
-Buildroot can be used for any combination of these options,
-independently.
+Buildroot is a tool that simplifies and automates the process of
+building a complete Linux system for an embedded system, using
+cross-compilation.
+
+In order to achieve this, Buildroot is able to generate a
+cross-compilation toolchain, a root filesystem, a Linux kernel image
+and a bootloader for your target. Buildroot can be used for any
+combination of these options, independently (you can for example use
+an existing cross-compilation toolchain, and build only your root
+filesystem with Buildroot).
 
 Buildroot is useful mainly for people working with embedded systems.
 Embedded systems often use processors that are not the regular x86
