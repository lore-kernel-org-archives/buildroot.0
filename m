From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2014 22:21:11 +0100
Subject: [Buildroot] [git commit] arch: use BR2_X86_CPU_HAS_SSE4,
	SSE42 with jaguar
Message-ID: <20140120212458.BA7929A988@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=485f07dd4c41a211041e73351b4477e21bbc2d68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This follow-up commit adds support for SSE 4 and SSE 4.2 to
the jaguar architecture.

Signed-off-by: Adrien B??raud <adrien.beraud@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86 |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index bbedfb4..8f6a527 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -131,6 +131,8 @@ config BR2_x86_jaguar
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
 	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_geode
 	bool "geode"
 	# Don't include MMX support because there several variant of geode
