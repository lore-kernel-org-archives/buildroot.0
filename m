From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 18 Jan 2014 21:00:05 +0800
Subject: [Buildroot] [PATCH] netstat-nat: add license information
Message-ID: <1390050005.16621.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/netstat-nat/netstat-nat.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
index d94c6f0..a936086 100644
--- a/package/netstat-nat/netstat-nat.mk
+++ b/package/netstat-nat/netstat-nat.mk
@@ -6,5 +6,7 @@
 
 NETSTAT_NAT_VERSION = 1.4.10
 NETSTAT_NAT_SITE = http://tweegy.nl/download
+NETSTAT_NAT_LICENSE = GPL
+NETSTAT_NAT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.1.2
