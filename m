From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 16 Jul 2015 14:15:13 -0700
Subject: [Buildroot] [PATCH] Add missing checksum for host-tar.
Message-ID: <1437081313-8271-1-git-send-email-hollis_blanchard@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes a very early error in a fresh build:
"ERROR: No hash found for tar-1.28.cpio.gz"

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
---
 package/tar/tar.hash |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index ffad2d2..5d2f1db 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking signature
 sha256	64ee8d88ec1b47a0961033493f919d27218c41b580138fd6802327462aff22f2	tar-1.28.tar.xz
+sha256	a3906a862f83dac1dfaf0ed200c62bd21f6d00f184a7f42b91978593a8553104	tar-1.28.cpio.gz
-- 
1.7.1
