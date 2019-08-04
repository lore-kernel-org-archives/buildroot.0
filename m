From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:41:47 +0200
Subject: [Buildroot] [PATCH 04/18] package/ebtables: add license hash
In-Reply-To: <20190804064201.10667-1-bernd.kuhls@t-online.de>
References: <20190804064201.10667-1-bernd.kuhls@t-online.de>
Message-ID: <20190804064201.10667-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ebtables/ebtables.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ebtables/ebtables.hash b/package/ebtables/ebtables.hash
index 45262765c2..f9222b8896 100644
--- a/package/ebtables/ebtables.hash
+++ b/package/ebtables/ebtables.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256	dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9a4455d	ebtables-v2.0.10-4.tar.gz
+sha256	ebdb8ae564c952792017ec680e2edd30443642216eb9f8a3d8fa166c0cb628c1	COPYING
-- 
2.20.1
