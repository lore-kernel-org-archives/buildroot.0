From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Nov 2012 13:58:15 -0800
Subject: [Buildroot] [git commit] ccache: Fix URL
Message-ID: <20121128220223.DB7358F6FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58c72c00466668ce168111048de1b2050687ad2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccache/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ccache/Config.in b/package/ccache/Config.in
index f4f7f8f..4a37973 100644
--- a/package/ccache/Config.in
+++ b/package/ccache/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_CCACHE
 	  caching previous compilations and detecting when the same
 	  compilation is being done again
 
-	  http://samba.ccache.org
+	  http://ccache.samba.org
 
