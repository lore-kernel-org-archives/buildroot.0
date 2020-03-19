From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 19 Mar 2020 21:12:28 +1300
Subject: [Buildroot] [PATCH] package/syslog-ng: Update has for COPYING
Message-ID: <20200319081228.26547-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the text was updated in syslog-ng-3.26.1. Update the hash
accordingly.

Fixes:
 - http://autobuild.buildroot.net/results/4e0768a5aae0f77e1382108b1ca06d0ad78f4da4
 - http://autobuild.buildroot.net/results/7430550dfce0bcb1bc5c9361033e26651883685a
 - http://autobuild.buildroot.net/results/56afedff96d17ab4800845d7777dd151cb431acf
 - http://autobuild.buildroot.net/results/2cac7eeaeabf8d77724ff283d3cb9026e778635c
 - http://autobuild.buildroot.net/results/a8189eab2a14cc5d04d90d8f1fa058b86889cc21

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index a752db0016..edb7efe195 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
 sha256 90214223864df252cea80dbb35c88a2464edcbbb2c9fbc6f6f6c13ee60cb62cd  syslog-ng-3.26.1.tar.gz
-sha256 835219c8ca76156e6337236d1bcb8e617c0b1c2783b4a8bc478e18a86743d607  COPYING
+sha256 e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
 sha256 ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
-- 
2.25.1
