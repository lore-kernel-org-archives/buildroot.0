From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Dec 2010 12:16:44 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: document
	savedefconfig in 'make help', like it's done in Linux
Message-ID: <20101207111737.794A08D35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d7051da8c618dbb2177e4d06ea0c8fe0ec46d13f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 96db291..8f0db1f 100644
--- a/Makefile
+++ b/Makefile
@@ -618,6 +618,7 @@ help:
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
 	@echo '  randconfig             - New config with random answer to all options'
 	@echo '  defconfig              - New config with default answer to all options'
+	@echo '  savedefconfig          - Save current config as ./defconfig (minimal config)'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
 	@echo '  randpackageconfig      - New config with random answer to package options'
-- 
1.7.2.2
