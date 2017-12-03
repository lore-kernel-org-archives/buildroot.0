From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun,  3 Dec 2017 18:20:08 -0500
Subject: [Buildroot] [PATCH 1/1] S20random: use consistent whitespace
Message-ID: <1512343208-7671-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The S20random is indented with tabs, except for 3 lines.  Change
to be consistent.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/initscripts/init.d/S20urandom | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/initscripts/init.d/S20urandom b/package/initscripts/init.d/S20urandom
index 2f5b4e4..cababe1 100755
--- a/package/initscripts/init.d/S20urandom
+++ b/package/initscripts/init.d/S20urandom
@@ -33,9 +33,9 @@ case "$1" in
 		;;
 	stop)
 		if ! touch /etc/random-seed 2>/dev/null
-                then
-                        exit
-                fi
+		then
+			exit
+		fi
 		# Carry a random seed from shut-down to start-up;
 		# see documentation in linux/drivers/char/random.c
 		[ "$VERBOSE" != no ] && printf "Saving random seed... "
-- 
2.7.4
