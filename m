From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:37 +0200
Subject: [Buildroot] [PATCH 11/11] Config.in: remove BR2_DEBIAN_MIRROR
	completely
In-Reply-To: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
References: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
Message-ID: <1414075717-7333-12-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 Config.in |   10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Config.in b/Config.in
index 9cefcbc..8d7081f 100644
--- a/Config.in
+++ b/Config.in
@@ -220,16 +220,6 @@ config BR2_GNU_MIRROR
 	     http://ftp.gnu.org/pub/gnu
 	     http://mirror.aarnet.edu.au/pub/gnu
 
-config BR2_DEBIAN_MIRROR
-	string "Debian Software mirror"
-	default "http://ftp.debian.org"
-	help
-	  Debian has multiple software mirrors scattered around the world.
-	  The following allows you to select your preferred mirror.
-
-	  Usually, just add your country code like XX here:
-	  http://ftp.XX.debian.org
-
 endif
 
 config BR2_LUAROCKS_MIRROR
-- 
1.7.10.4
