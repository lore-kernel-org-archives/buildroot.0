From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with changes
	from Thomas' bootloaders-cleanup branch
Message-ID: <20100614203445.21D4B804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7a3e7577af7f4bcc71d0c1f763ec44017fdb4a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index bd35ac5..f0822d5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,9 @@
 
 	Fixes all over the tree and new features.
 
+	Bootloaders: Various cleanups, moved to boot/, added Barebox,
+	removed yaboot. Support building u-boot from custom tarball.
+
 	New GTK-based configurator, usable using 'make gconfig'.
 
 	New packages: cgilua, copas, coxpcall, luafilesystem,
-- 
1.7.1
