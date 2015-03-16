From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Mar 2015 10:46:05 +0200
Subject: [Buildroot] [PATCH] ofono: refer to explicit hash source
Message-ID: <72c9f91f2ac4b01e001e80736144ce61a51fb483.1426495565.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ofono/ofono.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index ddf9bf017e6e..e83ce1a9f0b3 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
+# From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
 sha256	403b98dadece8bc804c0bd16b96d3db5a3bb0f84af64b3d67924da2d1a754b07  ofono-1.16.tar.xz
-- 
2.1.4
