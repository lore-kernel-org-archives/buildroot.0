From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Dec 2014 12:02:34 +0100
Subject: [Buildroot] [PATCH 1/5 v2] pkg-download: fix arguments to hash
	checking script
In-Reply-To: <cover.1417949583.git.yann.morin.1998@free.fr>
References: <cover.1417949583.git.yann.morin.1998@free.fr>
Message-ID: <2887bc5c3ac5d965f032c7b3318b95d28a2029b3.1417949583.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The argument are correctly used, but incorrectly documented.
Inverse the comments to match the actual usage.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/check-hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 067e7a2..13e361a 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -3,8 +3,8 @@ set -e
 
 # Helper to check a file matches its known hash
 # Call it with:
-#   $1: the full path to the file to check
-#   $2: the path of the file containing all the the expected hashes
+#   $1: the path of the file containing all the the expected hashes
+#   $2: the full path to the file to check
 
 h_file="${1}"
 file="${2}"
-- 
1.9.1
