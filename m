From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 25 Oct 2009 22:16:01 +0100
Subject: [Buildroot] [git commit master] CHANGES: add #593
Message-ID: <20091025211704.B4249777C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=da25e92b081ca9cbf6e3603528d5902ce2ea9766
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Issue #593 got (unknowingly) fixed by 7f7bf9637e2a9c3.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0b82254..d6b7c03 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,6 +24,7 @@
 	#527: misc fixes for dnsmasq package
 	#565: libevent: Bump version and clean up makefile
 	#587: Use iptables multipurpose binaries and bump to 1.4.4
+	#593: Missing early check for patch(1)
 	#609: libmicrohttpd: New package
 	#615: python: Don't delete .py files unless asked
 	#617: netkit/inetd requires RPC and fails to build if RPC is disabled
-- 
1.6.3.3
