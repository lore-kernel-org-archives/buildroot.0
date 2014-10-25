From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:26:45 +0200
Subject: [Buildroot] [git commit] Config.in: remove BR2_DEBIAN_MIRROR
	completely
Message-ID: <20141025095905.905AEB13C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39b790c9ba68bac14b470bc4fbe86cb41943e158
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

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
