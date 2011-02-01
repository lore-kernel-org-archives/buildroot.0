From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Feb 2011 14:30:32 +0100
Subject: [Buildroot] [git commit master 1/1] package/dhcp: Fix config name
Message-ID: <20110201133311.269738E5FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=99f33db2911b326dd57b1f64dfbcc47b74349caf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ISC dhcp is no longer the only way of handling DHCP, so use a less generic
config text.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dhcp/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index eeb237c..2245839 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_DHCP
-	bool "DHCP support"
+	bool "isc dhcp"
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
-- 
1.7.3.4
