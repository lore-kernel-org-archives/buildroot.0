From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Dec 2013 12:09:31 +0100
Subject: [Buildroot] [PATCH] Config.in files: fix incorrect indentation
Message-ID: <2166441ba7cde936e9f7.1387969771@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tab instead of spaces

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 fs/ext2/Config.in                    |  6 +++---
 package/libxml2/Config.in            |  2 +-
 package/openvpn/Config.in            |  2 +-
 package/python-pyasn/Config.in       |  2 +-
 package/python-pysnmp-apps/Config.in |  2 +-
 package/python-pysnmp-mibs/Config.in |  2 +-
 package/python-pysnmp/Config.in      |  2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -38,9 +38,9 @@ config BR2_TARGET_ROOTFS_EXT2_GEN
 
 # All ext generations are revision 1, except ext2r0, which is revision 0
 config BR2_TARGET_ROOTFS_EXT2_REV
-    int
-    default 0   if BR2_TARGET_ROOTFS_EXT2_2r0
-    default 1   if !BR2_TARGET_ROOTFS_EXT2_2r0
+	int
+	default 0   if BR2_TARGET_ROOTFS_EXT2_2r0
+	default 1   if !BR2_TARGET_ROOTFS_EXT2_2r0
 
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "size in blocks (leave at 0 for auto calculation)"
diff --git a/package/libxml2/Config.in b/package/libxml2/Config.in
--- a/package/libxml2/Config.in
+++ b/package/libxml2/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBXML2
 	  http://xmlsoft.org/
 
 config BR2_PACKAGE_HOST_LIBXML2_PYTHON
-    bool
\ No newline at end of file
+	bool
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
- 	help
+	help
 	  OpenVPN is a full-featured SSL VPN solution which can
 	  accomodate a wide range of configurations, including road
 	  warrior access, home/office/campus telecommuting, WiFi
diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
--- a/package/python-pyasn/Config.in
+++ b/package/python-pyasn/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_PYTHON_PYASN
 	  https://code.google.com/p/pyasn/
 
 comment "python-pyasn needs a toolchain w/ C++"
-        depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
--- a/package/python-pysnmp-apps/Config.in
+++ b/package/python-pysnmp-apps/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_PYTHON_PYSNMP_APPS
 	  http://pysnmp.sf.net
 
 comment "python-pysnmp-apps needs a toolchain w/ C++"
-        depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
--- a/package/python-pysnmp-mibs/Config.in
+++ b/package/python-pysnmp-mibs/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
 	  http://pysnmp.sf.net
 
 comment "python-pysnmp-libs needs a toolchain w/ C++"
-        depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_PYTHON_PYSNMP
 	  http://pysnmp.sf.net
 
 comment "python-pysnmp needs a toolchain w/ C++"
-        depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP
