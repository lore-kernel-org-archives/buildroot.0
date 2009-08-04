From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Aug 2009 22:58:54 +0200
Subject: [Buildroot] [git commit] CHANGES: add post-rc1 issues resolved
Message-ID: <20090804205954.D4ED277823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0468b5c132ce8b5e8bd0ae0e0b2414296059bd1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 36b9b45..6946fb2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2009.08, Not yet released:
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#525: sed broken with external toolchain
+
 2009.08-rc1, Released August 2nd, 2009:
 
 	Fixes all over the tree and new features.
@@ -77,7 +83,6 @@
 	#497: OpenSSL RSA key generation hangs on x86_64
 	#509: Bump sqlite package to 3.6.16
 	#523: pciutils broken with external toolchain
-	#525: sed broken with external toolchain
 	#533: Update gamin to 0.1.10 to fix compilation
 
 2009.05, Released June 1st, 2009:
-- 
1.6.3.3
