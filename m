From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 11:32:03 +0200
Subject: [Buildroot] [git commit] arch/Config.in.x86: drop trailing dot (.)
	from x1000 URL
Message-ID: <20151020093303.A7FAD8191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8da1239a12276baa9e8193c7ed49da3234d2900c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add an empty line below for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index dca30da..771c20f 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -43,7 +43,8 @@ config BR2_x86_x1000
 	  lock prefix requiring that prefix must be stripped at build
 	  time.
 
-	  See https://en.wikipedia.org/wiki/Intel_Quark.
+	  See https://en.wikipedia.org/wiki/Intel_Quark
+
 config BR2_x86_i686
 	bool "i686"
 	depends on !BR2_x86_64
