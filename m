From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 08 Oct 2013 15:49:25 +0200
Subject: [Buildroot] [PATCH] conntrack-tools: correct license GPLv2 -> GPLv2+
Message-ID: <59413208037947d31c30.1381240165@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/conntrack-tools/conntrack-tools.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -10,7 +10,7 @@ CONNTRACK_TOOLS_SITE = http://www.netfil
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
 	libnetfilter_conntrack libnetfilter_cthelper libnetfilter_cttimeout \
 	libnetfilter_queue host-bison host-flex
-CONNTRACK_TOOLS_LICENSE = GPLv2
+CONNTRACK_TOOLS_LICENSE = GPLv2+
 CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
