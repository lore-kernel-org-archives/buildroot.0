From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Sep 2009 17:42:22 +0200
Subject: [Buildroot] [git commit master] CHANGES: add #609 / #615 covered by
	Will's pull request
Message-ID: <20090921154312.B2F1377764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=171683950fb1a2a917c3769d6830ff47cf5835f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index daf0d4a..ce09610 100644
--- a/CHANGES
+++ b/CHANGES
@@ -11,6 +11,8 @@
 	#527: misc fixes for dnsmasq package
 	#565: libevent: Bump version and clean up makefile
 	#587: Use iptables multipurpose binaries and bump to 1.4.4
+	#609: libmicrohttpd: New package
+	#615: python: Don't delete .py files unless asked
 	#617: netkit/inetd requires RPC and fails to build if RPC is disabled
 	#619: netkittelnet requires netkitbase to install, but there's no dependency
 
-- 
1.6.3.3
