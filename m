From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 09:33:03 +0100
Subject: [Buildroot] [git commit] legacy/sqlite: add "sqlite" to legacy
	option name
Message-ID: <20161220091251.EC7FF80811@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62da71c980fe2e44059e4d6a7e00cbe279905a26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "command-line editing support was updated" does not indicate
the package name, unlike the other legacy options.  This commit
adds "sqlite", to be nicer.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
