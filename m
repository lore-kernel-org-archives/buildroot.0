From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 23:16:49 +0100
Subject: [Buildroot] [git commit] Config.in.arch: Fix microblaze-be double
	quote issue
Message-ID: <20120318230259.BFC2890E97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bf3dc764f76d85de3c2fcb25c5a247289334bfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 1910ff6..17e0236 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -24,7 +24,7 @@ config BR2_m68k
 config BR2_microblazeel
 	bool "Microblaze AXI (little-endian)"
 config BR2_microblazebe
-	bool "Microblaze non-AXI (big-endian)""
+	bool "Microblaze non-AXI (big-endian)"
 config BR2_mips
 	bool "mips"
 config BR2_mipsel
