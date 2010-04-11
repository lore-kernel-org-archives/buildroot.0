From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:08 +0200
Subject: [Buildroot] [PATCH 12/25] Remove the BR2_RECENT option
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c5e56b600ac0206ae7a4f9a8537c7fe43a61f6fe.1270958653.git.thomas.petazzoni@free-electrons.com>
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
index 7e51c84..430cb4f 100644
--- a/Config.in
+++ b/Config.in
@@ -141,12 +141,6 @@ config BR2_DEPRECATED
 	help
 	  This option hides outdated/obsolete versions of packages.
 
-config BR2_RECENT
-	bool "Show packages that are of the latest major version"
-	default y
-	help
-	  This option show recent versions of packages.
-
 config BR2_CONFIG_CACHE
 	bool "Use a central configure cache file"
 	default y
-- 
1.6.3.3
