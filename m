From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:41:50 +0200
Subject: [Buildroot] [PATCH 07/18] package/flickcurl: add license hash
In-Reply-To: <20190804064201.10667-1-bernd.kuhls@t-online.de>
References: <20190804064201.10667-1-bernd.kuhls@t-online.de>
Message-ID: <20190804064201.10667-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/flickcurl/flickcurl.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/flickcurl/flickcurl.hash b/package/flickcurl/flickcurl.hash
index fd091ec4a5..92ba68361e 100644
--- a/package/flickcurl/flickcurl.hash
+++ b/package/flickcurl/flickcurl.hash
@@ -1,2 +1,7 @@
 # Locally calculated after checking pgp signature
 sha256	ff42a36c7c1c7d368246f6bc9b7d792ed298348e5f0f5d432e49f6803562f5a3	flickcurl-1.26.tar.gz
+# Locally computed
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
+sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING.LIB
+sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	LICENSE-2.0.txt
+sha256	3590f30b0fb9446a1f0a7ea5bcbb5786fa66fa362800f53d2575875d74b91909	LICENSE.html
-- 
2.20.1
