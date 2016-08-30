From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Aug 2016 22:49:29 +0200
Subject: [Buildroot] [git commit branch/next] alljoyn-tcl: bump to version
	16.04a
Message-ID: <20160830205026.75684822DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af6865a4faf35b3abde368ed4d47f0f0cdc8ca2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alljoyn-tcl/alljoyn-tcl.hash | 2 +-
 package/alljoyn-tcl/alljoyn-tcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alljoyn-tcl/alljoyn-tcl.hash b/package/alljoyn-tcl/alljoyn-tcl.hash
index a1cdf16..208d676 100644
--- a/package/alljoyn-tcl/alljoyn-tcl.hash
+++ b/package/alljoyn-tcl/alljoyn-tcl.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	ce6a05a67ff405ba6274e85fe750d98f40cbe7ab2c968218c7741a10bd86e21a	ajtcl-16.04.00-src.tar.gz
+sha256	da13614a9db79067937b744a87328fed84d99ba62e3de19b0ddc4a83e4b2447e	ajtcl-16.04.00a-src.tar.gz
diff --git a/package/alljoyn-tcl/alljoyn-tcl.mk b/package/alljoyn-tcl/alljoyn-tcl.mk
index a5c7e4e..cabdf89 100644
--- a/package/alljoyn-tcl/alljoyn-tcl.mk
+++ b/package/alljoyn-tcl/alljoyn-tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ALLJOYN_TCL_REV = 16.04
-ALLJOYN_TCL_VERSION = $(ALLJOYN_TCL_REV).00
+ALLJOYN_TCL_VERSION = $(ALLJOYN_TCL_REV).00a
 ALLJOYN_TCL_SOURCE = ajtcl-$(ALLJOYN_TCL_VERSION)-src.tar.gz
 ALLJOYN_TCL_SITE = \
 	https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_TCL_REV)
