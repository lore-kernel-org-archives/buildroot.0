From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:05 -0000
Subject: [Buildroot] [git commit branch/next] tar: add missing hash for host
	variant
Message-ID: <20150808105635.C92917FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3788ad02cb7eb7e8384168a07e84223ae19e6f2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This fixes a very early error in a fresh build:
"ERROR: No hash found for tar-1.28.cpio.gz"

[Thomas: adjust commit title.]

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
