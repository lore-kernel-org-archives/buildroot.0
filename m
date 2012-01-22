From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 21:44:57 +0100
Subject: [Buildroot] [git commit] libidn: bump to version 1.24
Message-ID: <20120122215542.D24BD90358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42c675281afd039f6c5423c114eab69889906697
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libidn/libidn.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 4708862..935240b 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-LIBIDN_VERSION = 1.19
-LIBIDN_SITE = http://ftp.gnu.org/gnu/libidn/
+LIBIDN_VERSION = 1.24
+LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPT = --disable-java --enable-csharp=no
