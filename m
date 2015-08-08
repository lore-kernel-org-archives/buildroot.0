From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:02 -0000
Subject: [Buildroot] [git commit branch/next] nfs-utils: Create missing
	directory sm.bak
Message-ID: <20150808105630.4C4D580414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a23d336fbdba575321cfddadf7d671810559b056
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nfs-utils/S60nfs |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 5e2a2c9..e163d80 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -10,6 +10,7 @@
 
 mkdir -p /var/lock/subsys
 mkdir -p /run/nfs/sm
+mkdir -p /run/nfs/sm.bak
 touch /run/nfs/rmtab
 
 start() {
