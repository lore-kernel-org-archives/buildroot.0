From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 May 2010 00:49:29 +0200
Subject: [Buildroot] [git commit master] CHANGES: #75 + #699 are now closed
Message-ID: <20100526225935.5C24E12DEF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ca999e097bb8e65eb15083bd8e8814108d35616a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index af73187..4926c6d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,6 +16,8 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#75: arm buildroot "unrecognized option" error
+	#699: Buildroot fails to copy libstdc++ to target when using external...
 	#1693: NTP trys IPV6 even if not configured error: 'IPV6_MULTICAST...
 	#1729: alsamixergui fails to build
 	#1801: Avahi-autoipd doesn't create TARGET_DIR/var/lib
-- 
1.6.3.3
