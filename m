From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2020 10:53:10 +0100
Subject: [Buildroot] [PATCH 1/3] package/gdb: cleanup in gdb-python-config
In-Reply-To: <cover.1609408378.git.yann.morin.1998@free.fr>
References: <cover.1609408378.git.yann.morin.1998@free.fr>
Message-ID: <ba783d6bca3059c76264d3556720005a060ac78f.1609408378.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There was a mix of leading spaces and TABs. Szitch to using only spaces.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
-- 
2.25.1
