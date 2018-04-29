From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 17:15:40 +0200
Subject: [Buildroot] [PATCH 1/1] libevent: add hash for license file
Message-ID: <20180429151540.11070-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
