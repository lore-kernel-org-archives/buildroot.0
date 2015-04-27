From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Apr 2015 12:35:53 +0300
Subject: [Buildroot] [PATCH 2/2] ramspeed: add hash
In-Reply-To: <618ca12806107797707e4aff6e80a6253aef04c7.1430127353.git.baruch@tkos.co.il>
References: <618ca12806107797707e4aff6e80a6253aef04c7.1430127353.git.baruch@tkos.co.il>
Message-ID: <7f50809ecd3d3f84f44d24b74ccc8d847f38e896.1430127353.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ramspeed/ramspeed.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ramspeed/ramspeed.hash

diff --git a/package/ramspeed/ramspeed.hash b/package/ramspeed/ramspeed.hash
new file mode 100644
index 000000000000..71052a34910e
--- /dev/null
+++ b/package/ramspeed/ramspeed.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	f84e2e42b2b6b221ef9b586f6ae63d863db4ff21858e0ce7c84622a7c9522950	ramspeed-2.6.0.tar.gz
-- 
2.1.4
