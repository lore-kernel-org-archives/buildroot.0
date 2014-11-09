From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Nov 2014 08:54:47 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: fix typo
Message-ID: <20141109080254.B1B11B5676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a95e98c0d4036a9b1618c1a41d928e3096631063
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d60f4eb..b126556 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -106,7 +106,7 @@ config BR2_x86_generic
 	select BR2_LEGACY
 	help
 	  The generic x86 CPU variant has been removed. Use another
-	  CPU variant insted.
+	  CPU variant instead.
 
 config BR2_GCC_VERSION_4_4_X
 	bool "gcc 4.4.x has been removed"
