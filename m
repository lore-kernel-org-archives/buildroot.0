From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Sep 2011 23:44:59 +0200
Subject: [Buildroot] [git commit] ipsec-tools: bump to version 0.8.0
Message-ID: <20110913214741.4582C8D59E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4a54dafcd2bac34cb386e506eda6f0f7991dbff4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ipsec-tools/ipsec-tools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 0861a05..dbc27a7 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-IPSEC_TOOLS_VERSION = 0.7.3
+IPSEC_TOOLS_VERSION = 0.8.0
 IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
-IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/0.7/
+IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/0.8/
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
-- 
1.7.3.4
