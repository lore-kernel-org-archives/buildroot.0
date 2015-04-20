From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Apr 2015 23:19:45 +0200
Subject: [Buildroot] [PATCH] package/b43-firmware: add missing hash for pre
	3.2 kernel archive
Message-ID: <1429564785-11856-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/b43-firmware/b43-firmware.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/b43-firmware/b43-firmware.hash b/package/b43-firmware/b43-firmware.hash
index bafd00c..efc1a6c 100644
--- a/package/b43-firmware/b43-firmware.hash
+++ b/package/b43-firmware/b43-firmware.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256 f1e7067aac5b62b67b8b6e4c517990277804339ac16065eb13c731ff909ae46f broadcom-wl-5.100.138.tar.bz2
+sha256 26a8c370f48fc129d0731cfd751c36cae1419b0bc8ca35781126744e60eae009 broadcom-wl-5.10.56.27.3_mipsel.tar.bz2
-- 
1.9.3
