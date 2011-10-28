From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Oct 2011 13:33:51 +0200
Subject: [Buildroot] [git commit] sh: Add ttySC* to securetty
Message-ID: <20111028122942.A2A8D8EDFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=939f0074ec4a7764647b8bdadcaa0d0403e0d9d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/securetty |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/securetty b/fs/skeleton/etc/securetty
index 4ab956f..6c07d7f 100644
--- a/fs/skeleton/etc/securetty
+++ b/fs/skeleton/etc/securetty
@@ -42,3 +42,7 @@ ttyAM1
 ttyAM2
 ttySC0
 ttySC1
+ttySC2
+ttySC3
+ttySC4
+ttySC5
