From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Feb 2011 15:54:50 +0100
Subject: [Buildroot] [git commit master 1/1] Config.in: Show BR version in
	title
Message-ID: <20110202145518.F29BF8F2F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6a53b7294430f80cb8db2dc5f408c1b7a75c400f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kconfig nowadays uses the mainmenu as the title, so add the version info
here, similar to how it is done in the Linux kernel.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index df0c7ce..423499a 100644
--- a/Config.in
+++ b/Config.in
@@ -1,6 +1,6 @@
 #
 
-mainmenu "Buildroot2 Configuration"
+mainmenu "Buildroot $BR2_VERSION Configuration"
 
 config BR2_HAVE_DOT_CONFIG
 	bool
-- 
1.7.3.4
