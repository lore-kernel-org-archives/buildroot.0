From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 19:47:24 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: Update has for COPYING
Message-ID: <20200320184106.D1C5082952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c384d6642a98dc13842a25c1c6f12b4fe57d5d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The COPYING file in syslog-ng is not the usual GPL text. Rather, it
defines what parts of the source is licensed under what licenses; it
also contains an FAQ that is supposed to clarify how the licenses should
be interpreted for various purposes, as well as the license for a
specific subset of the soruce tree.

In 3.26.1, this file was modified according to the new or removed parts
of the source tree, but we missed that when bumping in commit afc0277137
(package/syslog-ng: Bump version to 2.26.1)

Update the hash accordingly.

Fixes:
 - http://autobuild.buildroot.net/results/4e0768a5aae0f77e1382108b1ca06d0ad78f4da4
 - http://autobuild.buildroot.net/results/7430550dfce0bcb1bc5c9361033e26651883685a
 - http://autobuild.buildroot.net/results/56afedff96d17ab4800845d7777dd151cb431acf
 - http://autobuild.buildroot.net/results/2cac7eeaeabf8d77724ff283d3cb9026e778635c
 - http://autobuild.buildroot.net/results/a8189eab2a14cc5d04d90d8f1fa058b86889cc21

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
