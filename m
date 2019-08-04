From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:41:53 +0200
Subject: [Buildroot] [PATCH 10/18] package/giflib: add license hash
In-Reply-To: <20190804064201.10667-1-bernd.kuhls@t-online.de>
References: <20190804064201.10667-1-bernd.kuhls@t-online.de>
Message-ID: <20190804064201.10667-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/giflib/giflib.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index cdd7bbdecd..189dca9f19 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/giflib/files
 md5	2c171ced93c0e83bb09e6ccad8e3ba2b	giflib-5.1.4.tar.bz2
 sha1	5f1157cfc377916280849e247b8e34fa0446513f	giflib-5.1.4.tar.bz2
+# Locally computed
+sha256	0c9b7990ecdca88b676db232c226548ac408b279f550d424d996f0d83591dd8e	COPYING
-- 
2.20.1
