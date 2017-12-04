From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Dec 2017 11:29:07 +0100
Subject: [Buildroot] [git commit] S20random: use consistent whitespace
Message-ID: <20171204102146.3B021827D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c41294481eb047514ee8bce53bc536ad2514893c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The S20random is indented with tabs, except for 3 lines.  Change
to be consistent.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
