From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 16 Oct 2015 17:00:02 +0100
Subject: [Buildroot] [PATCH buildroot-test] Update CodeSourcery MIPS
	toolchains config files
In-Reply-To: <1445011202-47571-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1445011202-47571-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1445011202-47571-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 web/toolchains/configs/sourcery-mips.config   |    1 +
 web/toolchains/configs/sourcery-mips64.config |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/web/toolchains/configs/sourcery-mips.config b/web/toolchains/configs/sourcery-mips.config
index 7ecf03b..a49fe70 100644
--- a/web/toolchains/configs/sourcery-mips.config
+++ b/web/toolchains/configs/sourcery-mips.config
@@ -1,3 +1,4 @@
 BR2_mips=y
+BR2_mips_32r2=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505=y
diff --git a/web/toolchains/configs/sourcery-mips64.config b/web/toolchains/configs/sourcery-mips64.config
index 987cf85..d89af1c 100644
--- a/web/toolchains/configs/sourcery-mips64.config
+++ b/web/toolchains/configs/sourcery-mips64.config
@@ -1,4 +1,5 @@
 BR2_mips64el=y
-BR2_mips_4=y
+BR2_mips_64r2=y
 BR2_MIPS_NABI64=y
 BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505=y
-- 
1.7.1
