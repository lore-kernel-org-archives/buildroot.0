From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:20 +0100
Subject: [Buildroot] [PATCH 30/32] package/x*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-31-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 .../x11r7/xcb-util-cursor/xcb-util-cursor.hash  |  2 ++
 .../xcb-util-renderutil.hash                    |  4 +++-
 .../xcursor-transparent-theme.hash              |  1 +
 package/x11r7/xlib_libXtst/xlib_libXtst.hash    |  4 +++-
 package/xenomai/xenomai.hash                    | 17 ++++++++++++++++-
 package/xmlstarlet/xmlstarlet.hash              |  2 ++
 6 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
index 36f2258dcb..1964624dc5 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2016-May/002691.html
 sha1	26562eb6d4151307f7b6a53453d360ecfc0563ac	xcb-util-cursor-0.1.3.tar.bz2
+# Locally computed
+sha256  0dde91ae1d443105dc9e13cbaed6674c36683b7095836ad9ddfce26be270aad5  COPYING
diff --git a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
index 1a1ad3e8a5..19ed9d4640 100644
--- a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
+++ b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2014-June/002446.html
-sha256	c6e97e48fb1286d6394dddb1c1732f00227c70bd1bedb7d1acabefdd340bea5b	xcb-util-renderutil-0.3.9.tar.bz2
+sha256  c6e97e48fb1286d6394dddb1c1732f00227c70bd1bedb7d1acabefdd340bea5b  xcb-util-renderutil-0.3.9.tar.bz2
+# Locally computed
+sha256  271169dd66674e9c396697af0b4822d1c59ccd2342b7740864d667a02963068b  COPYING
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.hash b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.hash
index 19f0de2eaa..52d230762a 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.hash
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  b26adf2d503d01299718390ae39dab4691a67220de09423be0364e9a060bf7e4  xcursor-transparent-theme-0.1.1.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.hash b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
index 7e55a75e27..f64a018567 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.hash
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2016-October/002726.html
-sha256 4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204  libXtst-1.2.3.tar.bz2
+sha256  4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204  libXtst-1.2.3.tar.bz2
+# Locally computed
+sha256  940190489c7a0e5ae3d83fc4fcbd79e0cd1b765bf1a4efd408293c1ee0332ceb  COPYING
diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index 7da3d0d4a1..7a07f06155 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,17 @@
 # Locally computed;
-sha256 080f893d6ab8e3065285fbb482695477a0502b9490dccd1f744cebaac94691e5  xenomai-3.0.10.tar.bz2
+sha256  080f893d6ab8e3065285fbb482695477a0502b9490dccd1f744cebaac94691e5  xenomai-3.0.10.tar.bz2
+sha256  d37ebe86bf618942dad958927c44403f9b02fbebb3071a4a08408ccbdab5290f  debian/copyright
+sha256  f3380321da72ff509bf6939aa80e6d02fd22268f5c705137b34c205b39bc63a0  include/COPYING
+sha256  d6b6d8ed1b12309085caf1cf775ea4acdad3288c7f7d993c2502bd19c87e4764  kernel/cobalt/COPYING
+sha256  d6b6d8ed1b12309085caf1cf775ea4acdad3288c7f7d993c2502bd19c87e4764  kernel/cobalt/posix/COPYING
+sha256  9c90501baa30534ffed6b39eef413bd1727170ef691fd9768dc8644c3042df54  kernel/cobalt/rtdm/COPYING
+sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  lib/alchemy/COPYING
+sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  lib/analogy/COPYING
+sha256  0519083691511d71408f8c9a2794fa2f6ad13a5eec00717f4572b54d18d6f9da  lib/boilerplate/iniparser/LICENSE
+sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  lib/boilerplate/COPYING
+sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  lib/cobalt/COPYING
+sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  lib/copperplate/COPYING
+sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  lib/psos/COPYING
+sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  lib/smokey/COPYING
+sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  lib/trank/COPYING
+sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  lib/vxworks/COPYING
diff --git a/package/xmlstarlet/xmlstarlet.hash b/package/xmlstarlet/xmlstarlet.hash
index ca9aecfec8..7191150957 100644
--- a/package/xmlstarlet/xmlstarlet.hash
+++ b/package/xmlstarlet/xmlstarlet.hash
@@ -1,3 +1,5 @@
 # From https://sourceforge.net/projects/xmlstar/files/xmlstarlet/1.6.1/
 sha1	87bb104f546caca71b9540807c5b2738944cb219	xmlstarlet-1.6.1.tar.gz
 md5	f3c5dfa3b1a2ee06cd57c255cc8b70a0		xmlstarlet-1.6.1.tar.gz
+# Locally computed
+sha256  6641cc5b00c1651fa22175f34efd01695e64a348b1ba07048538276f44866862  COPYING
-- 
2.20.1
