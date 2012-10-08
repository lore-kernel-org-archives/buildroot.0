From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 21:37:19 +0200
Subject: [Buildroot] [git commit] sylpheed: fix upstream URL
Message-ID: <20121008195647.ED7F3997FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65ba9c49190b533cdaa41ce09dfd68a924859324
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sylpheed/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sylpheed/Config.in b/package/sylpheed/Config.in
index 16f03be..f03ae87 100644
--- a/package/sylpheed/Config.in
+++ b/package/sylpheed/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_SYLPHEED
 	help
 	  lightweight and user-friendly e-mail client.
 
-	  http://sylpheed.sraoss.jp/sylpheed/v2.4
+	  http://sylpheed.sraoss.jp/en/
