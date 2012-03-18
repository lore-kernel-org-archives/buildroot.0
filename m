From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 18 Mar 2012 23:53:38 +0100
Subject: [Buildroot] [PATCH] Config.in.arch: fix quoting of BR2_microblazebe
Message-ID: <1332111218-23707-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Sorry for not noticing before :-)

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
-- 
tg: (b6a507c..) t/fix-Config.in.arch (depends on: master)
