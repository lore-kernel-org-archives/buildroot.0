From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  4 Apr 2017 19:50:10 -0300
Subject: [Buildroot] [PATCH 02/11] package: remove empty line at end of file
In-Reply-To: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
References: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
Message-ID: <20170404225019.27916-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Occurrences were searched using [1]:
check-package --include-only EmptyLastLine $(find * -type f)
and manually removed.

[1] http://patchwork.ozlabs.org/patch/729666/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/acpica/acpica.hash                                             | 1 -
 package/cbootimage/cbootimage.mk                                       | 1 -
 package/freescale-imx/imx-kobs/Config.in                               | 1 -
 package/freescale-imx/imx-lib/Config.in                                | 1 -
 package/guile/Config.in                                                | 1 -
 package/libcli/Config.in                                               | 1 -
 package/libfreeimage/libfreeimage.mk                                   | 1 -
 package/ljsyscall/Config.in                                            | 1 -
 package/lua-csnappy/Config.in                                          | 1 -
 package/luasql-sqlite3/Config.in                                       | 1 -
 package/netsnmp/netsnmp.hash                                           | 1 -
 package/perl-netaddr-ip/Config.in                                      | 1 -
 package/ptpd2/Config.in                                                | 1 -
 package/python-cbor/Config.in                                          | 1 -
 package/python-iniparse/python-iniparse.hash                           | 1 -
 package/python-lxml/Config.in.host                                     | 1 -
 package/python3/python3.hash                                           | 1 -
 package/ts4900-fpga/Config.in                                          | 1 -
 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk | 1 -
 19 files changed, 19 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 8f1c08a67..71c110ba8 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,2 @@
 # locally computed hash
 sha256 dfb33db5599bd48134dbd6e50c8804099be0cf1c35d98975a6cb84dabca78b67 acpica-unix2-20161117.tar.gz
-
diff --git a/package/cbootimage/cbootimage.mk b/package/cbootimage/cbootimage.mk
index 22a6e5331..40a248aed 100644
--- a/package/cbootimage/cbootimage.mk
+++ b/package/cbootimage/cbootimage.mk
@@ -12,4 +12,3 @@ CBOOTIMAGE_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-
diff --git a/package/freescale-imx/imx-kobs/Config.in b/package/freescale-imx/imx-kobs/Config.in
index fc2344ed0..61be9f26d 100644
--- a/package/freescale-imx/imx-kobs/Config.in
+++ b/package/freescale-imx/imx-kobs/Config.in
@@ -7,4 +7,3 @@ config BR2_PACKAGE_IMX_KOBS
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
-
diff --git a/package/freescale-imx/imx-lib/Config.in b/package/freescale-imx/imx-lib/Config.in
index 3b0f7a921..368770504 100644
--- a/package/freescale-imx/imx-lib/Config.in
+++ b/package/freescale-imx/imx-lib/Config.in
@@ -13,4 +13,3 @@ config BR2_PACKAGE_IMX_LIB
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
-
diff --git a/package/guile/Config.in b/package/guile/Config.in
index e0f657127..c26c296e4 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -19,4 +19,3 @@ config BR2_PACKAGE_GUILE
 comment "guile needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
-
diff --git a/package/libcli/Config.in b/package/libcli/Config.in
index e20afb0e0..3b625c364 100644
--- a/package/libcli/Config.in
+++ b/package/libcli/Config.in
@@ -8,4 +8,3 @@ config BR2_PACKAGE_LIBCLI
 	  tree.
 
 	  http://sites.dparrish.com/libcli
-
diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
index cd73f5a8e..0ca23933a 100644
--- a/package/libfreeimage/libfreeimage.mk
+++ b/package/libfreeimage/libfreeimage.mk
@@ -30,4 +30,3 @@ define LIBFREEIMAGE_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
index 149e71d3f..d78591ec9 100644
--- a/package/ljsyscall/Config.in
+++ b/package/ljsyscall/Config.in
@@ -9,4 +9,3 @@ config BR2_PACKAGE_LJSYSCALL
 
 comment "ljsyscall needs LuaJIT"
 	depends on !BR2_PACKAGE_LUAJIT
-
diff --git a/package/lua-csnappy/Config.in b/package/lua-csnappy/Config.in
index 0562277a0..54d68a2e1 100644
--- a/package/lua-csnappy/Config.in
+++ b/package/lua-csnappy/Config.in
@@ -5,4 +5,3 @@ config BR2_PACKAGE_LUA_CSNAPPY
 	  which implements the Google's Snappy (de)compressor.
 
 	  http://fperrad.github.io/lua-csnappy/
-
diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
index 3bd73f3ba..483d6a0f3 100644
--- a/package/luasql-sqlite3/Config.in
+++ b/package/luasql-sqlite3/Config.in
@@ -6,4 +6,3 @@ config BR2_PACKAGE_LUASQL_SQLITE3
 	  LuaSQL is a simple interface from Lua to a DBMS.
 
 	  http://www.keplerproject.org/luasql
-
diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index 2c18441fe..fc7792602 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -1,4 +1,3 @@
 # From http://sourceforge.net/projects/net-snmp/files/net-snmp/5.7.3/
 md5	d4a3459e1577d0efa8d96ca70a885e53	net-snmp-5.7.3.tar.gz
 sha1	97dc25077257680815de44e34128d365c76bd839	net-snmp-5.7.3.tar.gz
-
diff --git a/package/perl-netaddr-ip/Config.in b/package/perl-netaddr-ip/Config.in
index 152583008..d4061e1df 100644
--- a/package/perl-netaddr-ip/Config.in
+++ b/package/perl-netaddr-ip/Config.in
@@ -4,4 +4,3 @@ config BR2_PACKAGE_PERL_NETADDR_IP
 	  Manages IPv4 and IPv6 addresses and subnets
 
 	  https://metacpan.org/release/NetAddr-IP
-
diff --git a/package/ptpd2/Config.in b/package/ptpd2/Config.in
index e88a9bb1a..406276af3 100644
--- a/package/ptpd2/Config.in
+++ b/package/ptpd2/Config.in
@@ -6,4 +6,3 @@ config BR2_PACKAGE_PTPD2
 	  (PTP) as defined by the IEEE-1588-2008.
 
 	  https://github.com/ptpd/ptpd
-
diff --git a/package/python-cbor/Config.in b/package/python-cbor/Config.in
index 2d0962d59..403fab3f0 100644
--- a/package/python-cbor/Config.in
+++ b/package/python-cbor/Config.in
@@ -4,4 +4,3 @@ config BR2_PACKAGE_PYTHON_CBOR
 	  RFC 7049 - Concise Binary Object Representation.
 
 	  https://pypi.python.org/pypi/cbor
-
diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
index d7d8e9336..f1f803823 100644
--- a/package/python-iniparse/python-iniparse.hash
+++ b/package/python-iniparse/python-iniparse.hash
@@ -1,4 +1,3 @@
 # md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5e573e9e9733d97623881ce9bbe5eca6, sha256 locally computed
 md5 5e573e9e9733d97623881ce9bbe5eca6 iniparse-0.4.tar.gz
 sha256 abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054  iniparse-0.4.tar.gz
-
diff --git a/package/python-lxml/Config.in.host b/package/python-lxml/Config.in.host
index 580e440e1..7bf1e4859 100644
--- a/package/python-lxml/Config.in.host
+++ b/package/python-lxml/Config.in.host
@@ -5,4 +5,3 @@ config BR2_PACKAGE_HOST_PYTHON_LXML
 	  libxml2 and libxslt.
 
 	  http://lxml.de/
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 694b09be1..26d08dee4 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -2,4 +2,3 @@
 md5 692b4fc3a2ba0d54d1495d4ead5b0b5c Python-3.6.1.tar.xz
 # Locally computed
 sha256 a01810ddfcec216bcdb357a84bfaafdfaa0ca42bbdaa4cb7ff74f5a9961e4041 Python-3.6.1.tar.xz
-
diff --git a/package/ts4900-fpga/Config.in b/package/ts4900-fpga/Config.in
index 7910631bc..77a73b5ae 100644
--- a/package/ts4900-fpga/Config.in
+++ b/package/ts4900-fpga/Config.in
@@ -9,4 +9,3 @@ config BR2_PACKAGE_TS4900_FPGA
 	  script expects to find it in the /boot folder.
 
 	  http://wiki.embeddedarm.com/wiki/TS-4900#FPGA_Changelog
-
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index 2a3e99745..b31d98fbf 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -33,4 +33,3 @@ define XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
-- 
2.11.0
