From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 19 Dec 2016 22:12:32 -0500
Subject: [Buildroot] [PATCH 1/1] legacy/sqlite: add "sqlite" to legacy
	option name
Message-ID: <1482203552-5676-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "command-line editing support was updated" does not indicate
the package name, unlike the other legacy options.  This commit
adds "sqlite", to be nicer.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 71faa8d..2811c7b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -649,7 +649,7 @@ config BR2_GCC_VERSION_4_5_X
 	  version instead.
 
 config BR2_PACKAGE_SQLITE_READLINE
-	bool "command-line editing support was updated"
+	bool "sqlite command-line editing support was updated"
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	select BR2_LEGACY
-- 
1.9.1
