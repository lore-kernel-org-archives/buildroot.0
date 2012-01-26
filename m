From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 15:19:26 +0100
Subject: [Buildroot] [git commit] avahi: S05avahi-setup.sh: fix s/pid/ipd/
	typo
Message-ID: <20120126142151.8E98F9058E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c4c38403df01c4cbbb89c8b327d184f5a4b4dc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/S05avahi-setup.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/avahi/S05avahi-setup.sh b/package/avahi/S05avahi-setup.sh
index 002f0c8..f42a4d3 100755
--- a/package/avahi/S05avahi-setup.sh
+++ b/package/avahi/S05avahi-setup.sh
@@ -2,7 +2,7 @@
 
 case "$1" in
     start|"")
-	if [ ! -d /tmp/avahi-autopid ]; then
+	if [ ! -d /tmp/avahi-autoipd ]; then
 	    rm -rf /tmp/avahi-autoipd
 	    mkdir /tmp/avahi-autoipd
 	    chown default.default /tmp/avahi-autoipd
