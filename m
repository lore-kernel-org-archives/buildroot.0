From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 21 Mar 2020 11:08:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/boinc: drop comment about server
 having no versioning
Message-ID: <20200321100820.137676-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

server has versioning since April 2018 and
https://github.com/BOINC/boinc/releases/tag/server_release%2F0.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boinc/boinc.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index b6a9374715..7bbc4dfbf4 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -7,8 +7,7 @@
 BOINC_VERSION_MAJOR = 7.16
 BOINC_VERSION = $(BOINC_VERSION_MAJOR).5
 # client_release can be used to build the Client and Manager but not the Server
-# part. The Server currently has no versioning (see
-# https://github.com/BOINC/boinc/pull/1798).
+# part.
 BOINC_SITE = \
 	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
 BOINC_LICENSE = LGPL-3.0+
-- 
2.25.1
