From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 19 Dec 2014 08:12:33 +0100
Subject: [Buildroot] [PATCH 1/1] manual: remove the extra whitespaces
Message-ID: <1418973154-4011-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 docs/manual/adding-packages-directory.txt          |    4 ++--
 docs/manual/adding-packages-generic.txt            |   18 +++++++++---------
 docs/manual/adding-packages-python.txt             |    2 +-
 docs/manual/configure-other-components.txt         |    2 +-
 docs/manual/contribute.txt                         |    2 +-
 docs/manual/customize-configuration.txt            |    8 ++++----
 docs/manual/customize-device-permission-tables.txt |    2 +-
 docs/manual/customize-packages.txt                 |    2 +-
 docs/manual/customize-quick-guide.txt              |    2 +-
 docs/manual/download-location.txt                  |    2 +-
 docs/manual/quickstart.txt                         |    2 +-
 docs/manual/using-buildroot-toolchain.txt          |    2 +-
 12 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index de03271..8a88282 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -134,7 +134,7 @@ config BR2_PACKAGE_E
   so it will not select +Package A+.
 
 * Since +Package B+ is selected but +Package A+ is not, this violates
-  the dependency of +Package B+ on +Package A+.  Therefore, in such a
+  the dependency of +Package B+ on +Package A+. Therefore, in such a
   situation, the transitive dependency has to be added explicitly:
 
 --------------------------
@@ -336,7 +336,7 @@ different way, using different infrastructures:
   compilation and installation of the package. This
   infrastructure must be used for all packages that do not use the
   autotools as their build system. In the future, other specialized
-  infrastructures might be written for other build systems.  We cover
+  infrastructures might be written for other build systems. We cover
   them through in a xref:generic-package-tutorial[tutorial] and a
   xref:generic-package-reference[reference].
 
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 67a7453..f20c9de 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -160,9 +160,9 @@ Makefile code necessary to make your package working.
 ==== +generic-package+ reference
 
 There are two variants of the generic target. The +generic-package+ macro is
-used for packages to be cross-compiled for the target.  The
+used for packages to be cross-compiled for the target. The
 +host-generic-package+ macro is used for host packages, natively compiled
-for the host.  It is possible to call both of them in a single +.mk+
+for the host. It is possible to call both of them in a single +.mk+
 file: once to create the rules to generate a target
 package and once to create the rules to generate a host package:
 
@@ -258,13 +258,13 @@ information is (assuming the package name is +libfoo+) :
   is unnecessary. When +HOST_LIBFOO_SITE_METHOD+ is not specified, it
   defaults to the value of +LIBFOO_SITE_METHOD+. +
   The possible values of +LIBFOO_SITE_METHOD+ are:
-  ** +wget+ for normal FTP/HTTP downloads of tarballs.  Used by
+  ** +wget+ for normal FTP/HTTP downloads of tarballs. Used by
      default when +LIBFOO_SITE+ begins with +http://+, +https://+ or
      +ftp://+.
-  ** +scp+ for downloads of tarballs over SSH with scp.  Used by
+  ** +scp+ for downloads of tarballs over SSH with scp. Used by
      default when +LIBFOO_SITE+ begins with +scp://+.
   ** +svn+ for retrieving source code from a Subversion repository.
-     Used by default when +LIBFOO_SITE+ begins with +svn://+.  When a
+     Used by default when +LIBFOO_SITE+ begins with +svn://+. When a
      +http://+ Subversion repository URL is specified in
      +LIBFOO_SITE+, one 'must' specify +LIBFOO_SITE_METHOD=svn+.
      Buildroot performs a checkout which is preserved as a tarball in
@@ -277,7 +277,7 @@ information is (assuming the package name is +libfoo+) :
      +LIBFOO_SITE+ 'must' contain the source URL as well as the remote
      repository directory. The module is the package name.
      +LIBFOO_VERSION+ is 'mandatory' and 'must' be a timestamp.
-  ** +git+ for retrieving source code from a Git repository.  Used by
+  ** +git+ for retrieving source code from a Git repository. Used by
      default when +LIBFOO_SITE+ begins with +git://+. The downloaded
      source code is cached as with the +svn+
      method.
@@ -288,13 +288,13 @@ information is (assuming the package name is +libfoo+) :
   ** +bzr+ for retrieving source code from a Bazaar repository. Used
      by default when +LIBFOO_SITE+ begins with +bzr://+. The
      downloaded source code is cached as with the +svn+ method.
-  ** +file+ for a local tarball.  One should use this when
+  ** +file+ for a local tarball. One should use this when
      +LIBFOO_SITE+ specifies a package tarball as a local filename.
      Useful for software that isn't available publicly or in version
      control.
-  ** +local+ for a local source code directory.  One should use this
+  ** +local+ for a local source code directory. One should use this
      when +LIBFOO_SITE+ specifies a local directory path containing
-     the package source code.  Buildroot copies the contents of the
+     the package source code. Buildroot copies the contents of the
      source directory into the package's build directory.
 
 * +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 3cbb87d..f81d625 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -142,7 +142,7 @@ therefore only use a few of them, or none.
 
 * +HOST_PYTHON_FOO_NEEDS_HOST_PYTHON+, to define the host python
   interpreter. The usage of this variable is limited to host
-  packages. The two supported value are +python2+ and +python3+.  It
+  packages. The two supported value are +python2+ and +python3+. It
   will ensures the right host python package is available and will
   invoke it for the build. If some build steps are overloaded, the
   right python interpreter must be explicitly called in the commands.
diff --git a/docs/manual/configure-other-components.txt b/docs/manual/configure-other-components.txt
index 514c95f..deb1fa2 100644
--- a/docs/manual/configure-other-components.txt
+++ b/docs/manual/configure-other-components.txt
@@ -23,7 +23,7 @@ xref:env-vars[] for more details.
 
 uClibc::
 +
-Configuration of uClibc is done in the same way as for BusyBox.  The
+Configuration of uClibc is done in the same way as for BusyBox. The
 configuration variable to specify an existing configuration file is
 +BR2_UCLIBC_CONFIG+. The command to make subsequent changes is +make
 uclibc-menuconfig+.
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index dd6fc8b..5f0762f 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -250,7 +250,7 @@ The best thing to rework a patch series is by interactive rebasing:
 information.
 
 When added to the individual commits, this changelog is added when
-editing the commit message.  Below the +Signed-off-by+ section, add
+editing the commit message. Below the +Signed-off-by+ section, add
 +---+ and your changelog.
 
 Although the changelog will be visible for the reviewers in the mail
diff --git a/docs/manual/customize-configuration.txt b/docs/manual/customize-configuration.txt
index 5723302..6224d40 100644
--- a/docs/manual/customize-configuration.txt
+++ b/docs/manual/customize-configuration.txt
@@ -37,7 +37,7 @@ store these configuration files is
 +board/<company>/<boardname>/foo.config+.
 
 Make sure that you create a configuration file 'before' changing
-the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+ etc. options.  Otherwise,
+the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+ etc. options. Otherwise,
 Buildroot will try to access this config file, which doesn't exist
 yet, and will fail. You can create the configuration file by running
 +make linux-menuconfig+ etc.
@@ -46,9 +46,9 @@ Buildroot provides a few helper targets to make the saving of
 configuration files easier.
 
 * +make linux-update-defconfig+ saves the linux configuration to the
-  path specified by +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+.  It
-  simplifies the config file by removing default values.  However,
-  this only works with kernels starting from 2.6.33.  For earlier
+  path specified by +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+. It
+  simplifies the config file by removing default values. However,
+  this only works with kernels starting from 2.6.33. For earlier
   kernels, use +make linux-update-config+.
 * +make busybox-update-config+ saves the busybox configuration to the
   path specified by +BR2_PACKAGE_BUSYBOX_CONFIG+.
diff --git a/docs/manual/customize-device-permission-tables.txt b/docs/manual/customize-device-permission-tables.txt
index 99cf5bd..02dd8ad 100644
--- a/docs/manual/customize-device-permission-tables.txt
+++ b/docs/manual/customize-device-permission-tables.txt
@@ -6,7 +6,7 @@
 
 Sometimes it is needed to set specific permissions or ownership on files
 or device nodes. For example, certain files may need to be owned by
-root.  Since the post-build scripts are not run as root, you cannot do
+root. Since the post-build scripts are not run as root, you cannot do
 such changes from there unless you use an explicit fakeroot from the
 post-build script.
 
diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
index e3ecb4c..9a5e8c5 100644
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-packages.txt
@@ -7,7 +7,7 @@
 In general, any new package should be added directly in the +package+
 directory and submitted to the Buildroot upstream project. How to add
 packages to Buildroot in general is explained in full detail in
-xref:adding-packages[] and will not be repeated here.  However, your
+xref:adding-packages[] and will not be repeated here. However, your
 project may need some proprietary packages that cannot be upstreamed.
 This section will explain how you can keep such project-specific
 packages in a project-specific directory.
diff --git a/docs/manual/customize-quick-guide.txt b/docs/manual/customize-quick-guide.txt
index 617cc9a..4ff185a 100644
--- a/docs/manual/customize-quick-guide.txt
+++ b/docs/manual/customize-quick-guide.txt
@@ -33,7 +33,7 @@ your project can be skipped.
    Set +BR2_ROOTFS_OVERLAY+
    to +board/<manufacturer>/<boardname>/rootfs-overlay+.
 1. Create a post-build script
-   +board/<manufacturer>/<boardname>/post_build.sh+.  Set
+   +board/<manufacturer>/<boardname>/post_build.sh+. Set
    +BR2_ROOTFS_POST_BUILD_SCRIPT+ to
    +board/<manufacturer>/<boardname>/post_build.sh+
 1. If additional setuid permissions have to be set or device nodes have
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 6a1bd67..cca7e7e 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -12,7 +12,7 @@ filesystem with exactly the same versions.
 
 If you maintain several Buildroot trees, it might be better to have a
 shared download location. This can be achieved by pointing the
-+BR2_DL_DIR+ environment variable to a directory.  If this is
++BR2_DL_DIR+ environment variable to a directory. If this is
 set, then the value of +BR2_DL_DIR+ in the Buildroot configuration is
 overridden. The following line should be added to +<~/.bashrc>+.
 
diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
index 975fffc..74158ae 100644
--- a/docs/manual/quickstart.txt
+++ b/docs/manual/quickstart.txt
@@ -102,7 +102,7 @@ This directory contains several subdirectories:
   +/dev/+ (Buildroot can't create them because Buildroot doesn't run
   as root and doesn't want to run as root). Also, it doesn't have the correct
   permissions (e.g. setuid for the busybox binary). Therefore, this directory
-  *should not be used on your target*.  Instead, you should use one of
+  *should not be used on your target*. Instead, you should use one of
   the images built in the +images/+ directory. If you need an
   extracted image of the root filesystem for booting over NFS, then
   use the tarball image generated in +images/+ and extract it as
diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 3c87282..9a98628 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -18,5 +18,5 @@ libraries and header files are.
 
 It is also possible to generate the Buildroot toolchain in a directory
 other than +output/host+ by using the +Build options -> Host dir+
-option.  This could be useful if the toolchain must be shared with
+option. This could be useful if the toolchain must be shared with
 other users.
-- 
1.7.9.5
