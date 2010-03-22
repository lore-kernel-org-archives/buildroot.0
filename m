From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Mar 2010 15:19:42 +0100
Subject: [Buildroot] [git commit master] CHANGES: add #1345
Message-ID: <20100322145736.8476577716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=60f2fb4f94a36e1e0f9653da8e7c9f44ed3307ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 45fea9e..3461cd5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,7 +10,8 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
-	#1273 BR2_INET_IPV6 does not enable IPv6 in pppd
+	#1273: BR2_INET_IPV6 does not enable IPv6 in pppd
+	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
 
 2010.02, Release February 26th, 2010:
 
-- 
1.6.3.3
