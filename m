From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  3 Dec 2016 10:25:13 +0100
Subject: [Buildroot] [PATCH] lsqlite3: fix hash
Message-ID: <20161203092513.29056-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/9c8973271591dbcd4e7ba397961cd8209cf4d2f6

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lsqlite3/lsqlite3.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lsqlite3/lsqlite3.hash b/package/lsqlite3/lsqlite3.hash
index e7d3ce0..7cf0358 100644
--- a/package/lsqlite3/lsqlite3.hash
+++ b/package/lsqlite3/lsqlite3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	090282f9b8df614d70d07442ba82de3cc02a2f44cb1059fda648155d4d7e52ef  lsqlite3-0.9.4-2.src.rock
+sha256	e6eb64a7ca3727c3093f3c37341d8ecadf9eac913e468eae413828476b19c225  lsqlite3-0.9.4-2.src.rock
-- 
2.9.3
