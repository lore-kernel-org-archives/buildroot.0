From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:31:38 +0200
Subject: [Buildroot] [PATCH 2/3] Remove the BR2_RECENT option
In-Reply-To: <cover.1271078939.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271078939.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e5d07810b29da13f7544f14135cc57033b960fb9.1271078939.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/Config.in b/Config.in
index 6a66d50..bc4fec2 100644
--- a/Config.in
+++ b/Config.in
@@ -132,12 +132,6 @@ config BR2_DEPRECATED
 	help
 	  This option hides outdated/obsolete versions of packages.
 
-config BR2_RECENT
-	bool "Show packages that are of the latest major version"
-	default y
-	help
-	  This option show recent versions of packages.
-
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
 	select BR2_PACKAGE_GDB_SERVER
-- 
1.6.3.3
