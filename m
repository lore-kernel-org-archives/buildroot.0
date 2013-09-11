From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 12:54:51 +0200
Subject: [Buildroot] [git commit] noip: needs mmu
Message-ID: <20130911110611.CD4739B6F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a313a4bae1710938a31368ddafd8b6173d357b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/noip/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/noip/Config.in b/package/noip/Config.in
index 02039dd..aea5deb 100644
--- a/package/noip/Config.in
+++ b/package/noip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NOIP
 	bool "noip"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Dynamic DNS update client for no-ip.com
 
