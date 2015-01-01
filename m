From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Jan 2015 21:23:49 +0100
Subject: [Buildroot] [PATCH 3/7] docs/manual: document LIBFOO_INSTALL_IMAGES
In-Reply-To: <cover.1420142707.git.yann.morin.1998@free.fr>
References: <cover.1420142707.git.yann.morin.1998@free.fr>
Message-ID: <9e0f3532292282fe4e180b20c41b4f4e46904978.1420142707.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Document it as are LIBFOO_INSTALL_STAGING and LIBFOO_INSTALL_TARGET.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-generic.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index f20c9de..e80fc33 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -317,6 +317,11 @@ information is (assuming the package name is +libfoo+) :
   variables are executed to install the package into the target
   directory.
 
+* +LIBFOOR_INSTALL_IMAGES+ can be set to +YES+ or +NO+ (default). If
+  set to +YES+, then the commands in the +LIBFOO_INSTALL_IMAGES_CMDS+
+  variable are executed to install the package into the images
+  directory.
+
 * +LIBFOO_CONFIG_SCRIPTS+ lists the names of the files in
   '$(STAGING_DIR)/usr/bin' that need some special fixing to make them
   cross-compiling friendly. Multiple file names separated by space can
-- 
1.9.1
