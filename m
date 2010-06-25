From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Jun 2010 13:49:36 +0200
Subject: [Buildroot] [git commit master 1/1] Deprecate rp-pppoe,
	functionality is in pppd
Message-ID: <20100625115337.645A881DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b3aee76065beced5ef508122930b83cc393c448
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rp-pppoe/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index 4c141e5..f2431f6 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RP_PPPOE
 	bool "pppoe"
+	depends on BR2_DEPRECATED
 	help
 	  An implementation of the Point-to-point protocol over Ethernet.
 
-- 
1.7.1
