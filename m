From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:08:03 +0100
Subject: [Buildroot] [git commit] pkg-download: fix arguments to hash
	checking script
Message-ID: <20141207210826.7CE0A80100@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dab47af5d9504b325d791bbda48fa9249a139f90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The argument are correctly used, but incorrectly documented.
Inverse the comments to match the actual usage.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/check-hash |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
