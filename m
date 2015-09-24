From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Sep 2015 20:50:00 +0200
Subject: [Buildroot] [git commit] chrony: S49chrony: fix starting message
Message-ID: <20150924185121.D4BDE81D3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85467bb6166f761409c9269d142f4b18e332560f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Purely cosmetical. The OK/FAIL should go on the same line as "Starting ..".

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/S49chrony |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/chrony/S49chrony b/package/chrony/S49chrony
index 66a50d5..058fd44 100755
--- a/package/chrony/S49chrony
+++ b/package/chrony/S49chrony
@@ -6,7 +6,7 @@
 
 case "$1" in
   start)
-	echo "Starting chrony: "
+	echo -n "Starting chrony: "
 	chronyd && echo "OK" || echo "FAIL"
 	;;
   stop)
