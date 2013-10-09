From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:35:10 +0200
Subject: [Buildroot] [git commit] mrouted: needs mmu
Message-ID: <20131009203638.1ED949B9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b8a4a48e03e16d515c5f3349b219c29857fd0f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mrouted/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index 1503cc6..bf4614d 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MROUTED
 	bool "mrouted"
+	depends on BR2_USE_MMU # fork()
 	help
 	  An implementation of the DVMRP multicast routing protocol.
 
