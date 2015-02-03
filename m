From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 17:09:34 +0100
Subject: [Buildroot] [git commit] system/skeleton: fix the new /var/run
	symbolic link
Message-ID: <20150203161015.2D1A880841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6ca6fc9a3714842485618676390aba114442511
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/var/run |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/system/skeleton/var/run b/system/skeleton/var/run
index 9ab376e..d1a2745 120000
--- a/system/skeleton/var/run
+++ b/system/skeleton/var/run
@@ -1 +1 @@
-../run
+../run/
\ No newline at end of file
