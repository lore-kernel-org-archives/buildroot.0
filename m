From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 15 Oct 2010 10:39:23 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: #2389 is resolved
Message-ID: <20101015084016.17E128D1EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=61f432ff015b63b6dadb58015ecfa7ff0b97c5fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3451a12..b8a4180 100644
--- a/CHANGES
+++ b/CHANGES
@@ -63,6 +63,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#2389: Generate a Makefile wrapper in $(O)
 	#2521: Can't compile sdl_mixer, mikmod.h can't be found
 	#2563: [PATCH] cairo: Expose the configure option to disable some...
 	#2581: libmms: Update to 0.6, and patch to work on architectures...
-- 
1.7.1
