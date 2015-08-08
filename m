From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:27 -0000
Subject: [Buildroot] [git commit branch/next] wmctrl/Config.in: update site
	URL
Message-ID: <20150808105618.ECC927FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c726455fed1212a696304c37e8ac417c8514aacd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wmctrl/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wmctrl/Config.in b/package/wmctrl/Config.in
index e0342b7..bc09431 100644
--- a/package/wmctrl/Config.in
+++ b/package/wmctrl/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_WMCTRL
 	  always-above or sticky, and to activate, close, move,
 	  resize, maximize and minimize them.
 
-	  http://tomas.styblo.name/wmctrl/
+	  https://sites.google.com/site/tstyblo/wmctrl/
 
 comment "wmctrl needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
