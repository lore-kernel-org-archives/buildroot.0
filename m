From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:26:58 +0100
Subject: [Buildroot] [git commit] docs/manual: document LIBFOO_INSTALL_IMAGES
Message-ID: <20150101212822.96ED2807FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab2f2484badfe729331f8028b510a480107a135d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Document it as are LIBFOO_INSTALL_STAGING and LIBFOO_INSTALL_TARGET.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index f20c9de..e3029ed 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -317,6 +317,11 @@ information is (assuming the package name is +libfoo+) :
   variables are executed to install the package into the target
   directory.
 
+* +LIBFOO_INSTALL_IMAGES+ can be set to +YES+ or +NO+ (default). If
+  set to +YES+, then the commands in the +LIBFOO_INSTALL_IMAGES_CMDS+
+  variable are executed to install the package into the images
+  directory.
+
 * +LIBFOO_CONFIG_SCRIPTS+ lists the names of the files in
   '$(STAGING_DIR)/usr/bin' that need some special fixing to make them
   cross-compiling friendly. Multiple file names separated by space can
