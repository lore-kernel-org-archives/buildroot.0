From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 14:44:01 +0100
Subject: [Buildroot] [git commit] package/gdb: cleanup in gdb-python-config
Message-ID: <20201231132635.15A6B839E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fe40110e89503f99fcf690dc96674c035285620
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There was a mix of leading spaces and TABs. Szitch to using only spaces.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/gdb-python-config | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/gdb/gdb-python-config b/package/gdb/gdb-python-config
index 0f002281d7..222f1cf6ba 100755
--- a/package/gdb/gdb-python-config
+++ b/package/gdb/gdb-python-config
@@ -21,16 +21,16 @@ fi
 
 case "$2" in
     --includes)
-	echo "-I${STAGING_DIR}/usr/include/python2.7"
-	;;
+        echo "-I${STAGING_DIR}/usr/include/python2.7"
+        ;;
     --ldflags)
-	echo "-lpthread -ldl -lutil -lm -lpython2.7"
-	;;
+        echo "-lpthread -ldl -lutil -lm -lpython2.7"
+        ;;
     --exec-prefix)
-	echo "/usr"
-	;;
+        echo "/usr"
+        ;;
     *)
-	echo "Bad arg $2." >&2
-	exit 1
-	;;
+        echo "Bad arg $2." >&2
+        exit 1
+        ;;
 esac
