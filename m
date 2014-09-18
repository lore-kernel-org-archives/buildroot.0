From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Sep 2014 21:39:25 +0200
Subject: [Buildroot] [PATCH 02 of 13] manual/developer guide: minor rework
 of 'adding board support' section
In-Reply-To: <patchbomb.1411069163@localhost>
References: <patchbomb.1411069163@localhost>
Message-ID: <1d3af4afbb188f2330fc.1411069165@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minor rework of the section 'Creating your own board support', as follows:
- Rename section into 'Adding support for a particular board'
- Modify introduction
- Refer to Project-specific customizations chapter

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-board-support.txt |  13 +++++++------
 docs/manual/customize.txt            |   1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -1,12 +1,13 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-[[customize-store-board-support]]
-== Creating your own board support
+[[adding-board-support]]
+== Adding support for a particular board
 
-Creating your own board support in Buildroot allows users of a
-particular hardware platform to easily build a system that is known to
-work.
+Buildroot contains basic configurations for several publicly available
+hardware boards, so that users of such a board can easily build a system
+that is known to work. You are welcome to add support for other boards
+to Buildroot too.
 
 To do so, you need to create a normal Buildroot configuration that
 builds a basic system for the hardware: toolchain, kernel, bootloader,
@@ -34,4 +35,4 @@
 create a directory +board/<manufacturer>+ and a subdirectory
 +board/<manufacturer>/<boardname>+. You can then store your patches
 and configurations in these directories, and reference them from the main
-Buildroot configuration.
+Buildroot configuration. Refer to xref:customize[] for more details.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -1,6 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
+[[customize]]
 == Project-specific customization
 
 Typical actions you may need to perform for a given project are:
