From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 11:24:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/flot: update hash
Message-ID: <1454235889-11021-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream apparently updated their tarball
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/122226/focus=138335

Issue reported upstream: https://github.com/flot/flot/issues/1484

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/flot/flot.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flot/flot.hash b/package/flot/flot.hash
index 9bf348a..cb9f9ec 100644
--- a/package/flot/flot.hash
+++ b/package/flot/flot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952	flot-0.8.3.tar.gz
+sha256	ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21	flot-0.8.3.tar.gz
-- 
2.7.0
