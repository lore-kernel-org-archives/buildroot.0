From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 14 Jun 2021 22:47:46 +0200
Subject: [Buildroot] [PATCH v1 1/4] package/libxmlrpc: bump version to
 1.51.07
Message-ID: <20210614204749.10693-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog ([1]):

  - Abyss: fix bug: wild memory reference when server times out waiting for
    request header. Introduced with Release 1.44 (December 2015).

[1] http://xmlrpc-c.sourceforge.net/change_super_stable.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libxmlrpc/libxmlrpc.hash | 2 +-
 package/libxmlrpc/libxmlrpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 13e3b0b534..7034773204 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06dcd87d9c88374559369ffbe83b3139cf41418c1a2d03f20e08808085f89fd0  xmlrpc-c-1.51.06.tgz
+sha256  84d20ae33f927582f821d61c0b9194aefbf1d7924590a13fa9da5ae1698aded9  xmlrpc-c-1.51.07.tgz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index c74d8a854c..0871b6e710 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLRPC_VERSION = 1.51.06
+LIBXMLRPC_VERSION = 1.51.07
 LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
 LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
-- 
2.31.1
