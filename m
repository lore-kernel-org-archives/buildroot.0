From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  8 Jun 2016 23:21:57 +0200
Subject: [Buildroot] [PATCH 1/3] pckage/openpowerlink: fix sha256 hash
Message-ID: <1465420919-3920-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While bumping to v2.4.0, the sha256 was commented by mistake
and the hash was for v2.3.2 archive.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/openpowerlink/openpowerlink.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index c879df1..d112947 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -2,4 +2,4 @@
 md5	a833ca76a162db04a28c36ccecfd8a05	openPOWERLINK_V2.4.0.tar.gz
 sha1	d2260f7d1b7f264dd7a0323509bec233d36aed11	openPOWERLINK_V2.4.0.tar.gz
 # sha256 locally computed
-#sha256	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	openPOWERLINK_V2.4.0.tar.gz
+sha256	7296556e621adfeeb643c6541747433ecf86176923d736ea909e9ff6dcf1650b	openPOWERLINK_V2.4.0.tar.gz
-- 
2.5.5
