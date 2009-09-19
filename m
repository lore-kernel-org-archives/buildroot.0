From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Sep 2009 19:33:51 +0200
Subject: [Buildroot] [git commit master] CHANGES: add #619
Message-ID: <20090919173414.CF24D77767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e18fcb48113b3405104568044dedb8589c5fdce5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index c8a5e3c..f3ecce8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,6 +10,7 @@
 	#527: misc fixes for dnsmasq package
 	#587: Use iptables multipurpose binaries and bump to 1.4.4
 	#617: netkit/inetd requires RPC and fails to build if RPC is disabled
+	#619: netkittelnet requires netkitbase to install, but there's no dependency
 
 2009.08, Released August 31th, 2009:
 
-- 
1.6.3.3
