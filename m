From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 19:29:10 +0200
Subject: [Buildroot] [git commit] libevent: add hash for license file
Message-ID: <20180429173110.3CC2C8A3CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58cededfd93e25db6e0571353a9306bc061207b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevent/libevent.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
index 21381c87b3..aa0358bcfe 100644
--- a/package/libevent/libevent.hash
+++ b/package/libevent/libevent.hash
@@ -1,3 +1,4 @@
 # locally computed
 md5	f3eeaed018542963b7d2416ef1135ecc	libevent-2.1.8-stable.tar.gz
 sha1	2a1b8bb7a262d3fd0ed6a080a20991a6eed675ec	libevent-2.1.8-stable.tar.gz
+sha256	ff02effc9b331edcdac387d198691bfa3e575e7d244ad10cb826aa51ef085670	LICENSE
