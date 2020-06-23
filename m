From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Jun 2020 18:31:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxmlrpc: bump to version 1.51.06
Message-ID: <20200623163143.866641-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxmlrpc/libxmlrpc.hash | 4 ++--
 package/libxmlrpc/libxmlrpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 093da67bbf..13e3b0b534 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c9f5b584a42493877ae0f09ed680d94e035ab389e8fa1873b1ec42118d5cfca3 xmlrpc-c-1.43.08.tgz
-sha256 db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6 doc/COPYING
+sha256  06dcd87d9c88374559369ffbe83b3139cf41418c1a2d03f20e08808085f89fd0  xmlrpc-c-1.51.06.tgz
+sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index ac4688d7ce..5ac91424ca 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLRPC_VERSION = 1.43.08
+LIBXMLRPC_VERSION = 1.51.06
 LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
 LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
-- 
2.26.2
