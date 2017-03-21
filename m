From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:07:02 +0100
Subject: [Buildroot] [PATCH 06/16] ubus: add hash
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-7-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ubus had a hash file, but is says "none" because it is a git download.
Since our git downloads are not reproducible, we can actually add a
hash.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ubus/ubus.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index af9b652b0e..4e6a755c7f 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,2 +1,2 @@
-# No hash for this git snapshot
-none  xxx  ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63.tar.gz
+# Locally calculated
+sha256  0dbf75c2103f3f567b9bf1bb719ea9776d18401bbf2dfd8bed2c2ebbdd1021da  ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63.tar.gz
-- 
2.11.0
