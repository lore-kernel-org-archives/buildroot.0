From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  8 Dec 2017 11:54:36 +0100
Subject: [Buildroot] [PATCH 1/4] python-iowait: add licence checksum
Message-ID: <20171208105439.1967-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-iowait/python-iowait.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-iowait/python-iowait.hash b/package/python-iowait/python-iowait.hash
index 67dac15f4a..fcaf8cc564 100644
--- a/package/python-iowait/python-iowait.hash
+++ b/package/python-iowait/python-iowait.hash
@@ -1,4 +1,4 @@
-# md5 from https://pypi.python.org/pypi/iowait/json
+# md5 from https://pypi.python.org/pypi/iowait/json, sha256 locally computed
 md5	f49ca7766fe4a67e03a731e575614f87  iowait-0.2.tar.gz
-# sha256 calculated by scanpypi
 sha256	ab1bc2eb84c22ccf61f17a0024f9fb6df781b39f1852764a66a7769d5adfb299  iowait-0.2.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
-- 
2.11.0
