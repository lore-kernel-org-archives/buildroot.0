From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jun 2010 21:02:45 +0200
Subject: [Buildroot] [git commit master] CHANGES: 2010.08 development started
Message-ID: <20100602190349.A066E8A2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc5e22ee93895a9d05da716478c16e47c951f404
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES   |    2 ++
 Config.in |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index e6c6803..f635864 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,5 @@
+2010.08, Not released yet:
+
 2010.05, Released May 30th, 2010:
 
 	Fixes all over the tree.
diff --git a/Config.in b/Config.in
index b52fbcc..435d4bd 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.05"
+	default "2010.08-git"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.3.3
