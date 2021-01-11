From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 21:15:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/netcat: set NETCAT_CPE_ID_VALID
Message-ID: <20210111201544.1414785-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netcat/netcat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index eb7ddcac27..c9d7952e59 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -8,5 +8,6 @@ NETCAT_VERSION = 0.7.1
 NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
 NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
+NETCAT_CPE_ID_VALID = YES
 
 $(eval $(autotools-package))
-- 
2.29.2
