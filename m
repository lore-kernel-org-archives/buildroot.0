From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 25 Apr 2015 14:39:38 +0200
Subject: [Buildroot] [PATCH] package/input-tools: add hash for
	joystick_20051019-5.diff.gz
Message-ID: <1429965578-16168-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/1f3/1f3c5c060cd98a3f4cf9688fc8a83cc1c23ece29

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/input-tools/input-tools.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/input-tools/input-tools.hash b/package/input-tools/input-tools.hash
index c82cae3..53b0f92 100644
--- a/package/input-tools/input-tools.hash
+++ b/package/input-tools/input-tools.hash
@@ -1,2 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/joystick/joystick_20051019-12.dsc
 sha256	cb60cb62093f1889a91fcef1cc36546aba406f451941e8d057f095639e6afb89	joystick_20051019.orig.tar.gz
+# From http://snapshot.debian.org/archive/debian/20090630T220234Z/pool/main/j/joystick/joystick_20051019-5.dsc
+sha256	01e9d14a656d594a3e261751233200f740a09c2a538ac71447c104ffe89ec10c	joystick_20051019-5.diff.gz
-- 
1.9.3
