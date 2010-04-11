From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Get rid of BR2_HAVE_{MANPAGES,
	INFOPAGES} config options
Message-ID: <20100411195034.C6C8020B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b703066033bb44f2ceb5b6a54bb4a2ae71d32669
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |   17 ++---------------
 1 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/Config.in b/Config.in
index f2d4a50..7e51c84 100644
--- a/Config.in
+++ b/Config.in
@@ -300,24 +300,11 @@ config BR2_PREFER_STATIC_LIB
 
 	  WARNING: This is highly experimental at the moment.
 
-config BR2_HAVE_MANPAGES
-	bool "manpages on the target"
-	help
-	  Leave the manpages on the target.
-	  If you say n here, your target will not contain any
-	  manpage.
-
-config BR2_HAVE_INFOPAGES
-	bool "infopages on the target"
-	help
-	  Leave the infopages on the target.
-	  If you say n here, your target will not contain any
-	  infopage.
-
 config BR2_HAVE_DOCUMENTATION
 	bool "documentation on the target"
 	help
-	  Leave the documentation on the target.
+	  Install the documentation, including manual pages and info
+	  pages, on the target.
 	  If you say n here, your target will not contain any
 	  documentation.
 
-- 
1.6.3.3
