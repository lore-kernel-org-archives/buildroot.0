From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 24 Jul 2009 07:51:16 +0200
Subject: [Buildroot] [git commit] CHANGES: add #163 + #473
Message-ID: <20090724055230.2080B77660@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0aa7062407d810bcaf999b61d4e2e1974c20632b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 781f5cf..3d61bc7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,6 +3,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#83: liblockfile fails to compile due to eaccess redefinition
+	#163: Xtensa architecture port
 	#241: device mapper + lvm2: build together
 	#271: Library 'libgcc_s.so.1' not installed in search path
 	#333: Bump sqlite package to 3.6.15
@@ -23,6 +24,7 @@
 	#417: New package spawn-fcgi
 	#419: Bump lighttpd package to 1.4.23
 	#467: DirectFB 1.4.1
+	#473: memstat_0.5.tar.gz has install with -D and that fails "make"
 
 2009.05, Released June 1st, 2009:
 
-- 
1.6.3.3
