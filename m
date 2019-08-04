From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 11:14:30 +0200
Subject: [Buildroot] [git commit] package/time: add upstream sha1 hash
Message-ID: <20190804091141.38B3C8DF1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a2f8ff552029f2e1d7db907c94c8907416a831b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also added a reference for upstream-provided sha1 & sha256 hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/time/time.hash | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/time/time.hash b/package/time/time.hash
index b843534a58..cea57dc254 100644
--- a/package/time/time.hash
+++ b/package/time/time.hash
@@ -1,3 +1,5 @@
-# Locally calculated
+# From https://lists.gnu.org/archive/html/info-gnu/2018-03/msg00004.html
+sha1	75068c26abbed3ad3980685bae21d7202d288317				time-1.9.tar.gz
 sha256	fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e	time-1.9.tar.gz
+# Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
