From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Feb 2013 22:50:04 +0100
Subject: [Buildroot] [git commit] manual: cleanup and update editor tags
Message-ID: <20130217221225.908559A7C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3edb0271db4e7c34b361f87db7bc02340877bab5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-autotools.txt  |    1 +
 docs/manual/adding-packages-cmake.txt      |    1 +
 docs/manual/adding-packages-conclusion.txt |    1 +
 docs/manual/adding-packages-directory.txt  |    1 +
 docs/manual/adding-packages-generic.txt    |    1 +
 docs/manual/adding-packages-gettext.txt    |    1 +
 docs/manual/adding-packages-tips.txt       |    1 +
 docs/manual/adding-packages.txt            |    3 ++-
 docs/manual/advanced.txt                   |    1 +
 docs/manual/appendix.txt                   |    1 +
 docs/manual/beyond-buildroot.txt           |    1 +
 docs/manual/ccache-support.txt             |    3 ++-
 docs/manual/common-usage.txt               |    1 +
 docs/manual/configure.txt                  |    3 ++-
 docs/manual/contribute.txt                 |    1 +
 docs/manual/customize-busybox-config.txt   |    3 ++-
 docs/manual/customize-kernel-config.txt    |    3 ++-
 docs/manual/customize-rootfs.txt           |    3 ++-
 docs/manual/customize-store.txt            |    3 ++-
 docs/manual/customize-toolchain.txt        |    3 ++-
 docs/manual/customize-uclibc-config.txt    |    3 ++-
 docs/manual/customize.txt                  |    1 +
 docs/manual/developer-guide.txt            |    1 +
 docs/manual/download-infra.txt             |    3 ++-
 docs/manual/download-location.txt          |    1 +
 docs/manual/eclipse-integration.txt        |    1 +
 docs/manual/faq-troubleshooting.txt        |    1 +
 docs/manual/get-involved.txt               |    1 +
 docs/manual/getting.txt                    |    3 ++-
 docs/manual/going-further.txt              |    1 +
 docs/manual/how-buildroot-works.txt        |    1 +
 docs/manual/introduction.txt               |    1 +
 docs/manual/legal-notice.txt               |    1 +
 docs/manual/make-tips.txt                  |    3 ++-
 docs/manual/makedev-syntax.txt             |    3 ++-
 docs/manual/manual.txt                     |    1 +
 docs/manual/package-make-target.txt        |    1 +
 docs/manual/patch-policy.txt               |    1 +
 docs/manual/prerequisite.txt               |    3 ++-
 docs/manual/rebuilding-packages.txt        |    3 ++-
 docs/manual/starting-up.txt                |    1 +
 docs/manual/using-buildroot-toolchain.txt  |    1 +
 docs/manual/using.txt                      |    1 +
 docs/manual/working-with.txt               |    1 +
 docs/manual/writing-rules.txt              |    1 +
 45 files changed, 60 insertions(+), 15 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 84d76f9..5a0d27f 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Infrastructure for autotools-based packages
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index bb1705b..44c38e9 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Infrastructure for CMake-based packages
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/docs/manual/adding-packages-conclusion.txt b/docs/manual/adding-packages-conclusion.txt
index 0f6f0ca..8e1b2c6 100644
--- a/docs/manual/adding-packages-conclusion.txt
+++ b/docs/manual/adding-packages-conclusion.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Conclusion
 ~~~~~~~~~~
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index cc68497..6296596 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Package directory
 ~~~~~~~~~~~~~~~~~
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 78df24a..74d379b 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Infrastructure for packages with specific build systems
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index 58fd98d..98c994c 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Gettext integration and interaction with packages
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index acdee40..21e520b 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Tips and tricks
 ~~~~~~~~~~~~~~~
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index b909d47..0123b32 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[adding-packages]]
 Adding new packages to Buildroot
diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
index 314d300..764b71a 100644
--- a/docs/manual/advanced.txt
+++ b/docs/manual/advanced.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Advanced usage
 --------------
diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 6f1e9f3..ef34169 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Appendix
 ========
diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index a87b584..a0d4af0 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Beyond Buildroot
 ================
diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
index 95cd662..4969180 100644
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[ccache]]
 Using +ccache+ in Buildroot
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 5566a39..c7f511a 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Daily use
 ---------
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 65e0eeb..86cb173 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[configure]]
 Details on Buildroot configuration
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index a33aab2..9425eff 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Contibuting to Buildroot
 ========================
diff --git a/docs/manual/customize-busybox-config.txt b/docs/manual/customize-busybox-config.txt
index fe9cdda..981d534 100644
--- a/docs/manual/customize-busybox-config.txt
+++ b/docs/manual/customize-busybox-config.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[busybox-custom]]
 Customizing the Busybox configuration
diff --git a/docs/manual/customize-kernel-config.txt b/docs/manual/customize-kernel-config.txt
index 1072270..a2d31ed 100644
--- a/docs/manual/customize-kernel-config.txt
+++ b/docs/manual/customize-kernel-config.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[kernel-custom]]
 Customizing the Linux kernel configuration
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index b1662cb..4a4d620 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[rootfs-custom]]
 Customizing the generated target filesystem
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index 63ea82d..d770f0e 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*-
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[customize-store]]
 Storing the configuration
diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 2b24412..4397979 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[toolchain-custom]]
 Customizing the toolchain
diff --git a/docs/manual/customize-uclibc-config.txt b/docs/manual/customize-uclibc-config.txt
index 38a1575..7fd20f7 100644
--- a/docs/manual/customize-uclibc-config.txt
+++ b/docs/manual/customize-uclibc-config.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[uclibc-custom]]
 Customizing the uClibc configuration
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index a13ba8f..3b1a5a7 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Customization
 -------------
diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
index 5002897..43272f5 100644
--- a/docs/manual/developer-guide.txt
+++ b/docs/manual/developer-guide.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Developer Guidelines
 ====================
diff --git a/docs/manual/download-infra.txt b/docs/manual/download-infra.txt
index 63908ad..fe031a6 100644
--- a/docs/manual/download-infra.txt
+++ b/docs/manual/download-infra.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[download-infra]]
 
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 36a1356..4aa8cea 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Location of downloaded packages
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/docs/manual/eclipse-integration.txt b/docs/manual/eclipse-integration.txt
index 3d8179f..d1a42cf 100644
--- a/docs/manual/eclipse-integration.txt
+++ b/docs/manual/eclipse-integration.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Integration with Eclipse
 ------------------------
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 5d9531b..f91a8ef 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Frequently Asked Questions & Troubleshooting
 ============================================
diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
index 59ddd71..8515d34 100644
--- a/docs/manual/get-involved.txt
+++ b/docs/manual/get-involved.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Getting involved
 ================
diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
index a51caa0..6b2a824 100644
--- a/docs/manual/getting.txt
+++ b/docs/manual/getting.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[getting-buildroot]]
 Getting Buildroot
diff --git a/docs/manual/going-further.txt b/docs/manual/going-further.txt
index 070e0a3..d3f1830 100644
--- a/docs/manual/going-further.txt
+++ b/docs/manual/going-further.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Going further in Buildroot's innards
 ====================================
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
index ec08f95..68ddd13 100644
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 How Buildroot works
 -------------------
diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.txt
index a567cec..c014565 100644
--- a/docs/manual/introduction.txt
+++ b/docs/manual/introduction.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 About Buildroot
 ===============
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 0f30234..51292f6 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[legal-info]]
 
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 8cd77c0..b4a9c12 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[make-tips]]
 'make' tips
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index 27517b3..2c98531 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[makedev-syntax]]
 Makedev syntax documentation
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index c34e0ca..ffb6fb9 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 The Buildroot user manual
 =========================
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 7374957..dc9d310 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[pkg-build-steps]]
 
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 9bc6537..78ac5b6 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[patch-policy]]
 
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 21e4627..5a9d049 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[requirement]]
 System requirements
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index d6a77a7..044c908 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -1,4 +1,5 @@
-// -*- mode:doc -*- ;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 [[full-rebuild]]
 Understanding when a full rebuild is necessary
diff --git a/docs/manual/starting-up.txt b/docs/manual/starting-up.txt
index 2999fd4..7326f60 100644
--- a/docs/manual/starting-up.txt
+++ b/docs/manual/starting-up.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Starting up
 ===========
diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 750fa99..b4db686 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Using the generated toolchain outside Buildroot
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 857aa33..de29ad6 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Using Buildroot
 ---------------
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
index fb6bc40..b69d1e2 100644
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Working with Buildroot
 ======================
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index f6382b5..c9816a4 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
 
 Coding style
 ------------
