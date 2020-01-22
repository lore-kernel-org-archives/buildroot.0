From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:48 +0100
Subject: [Buildroot] [PATCH 16/26] package/ctorrent: add hash for license
 file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-17-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/ctorrent/ctorrent.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ctorrent/ctorrent.hash b/package/ctorrent/ctorrent.hash
index 6dcb590b95..3e82902628 100644
--- a/package/ctorrent/ctorrent.hash
+++ b/package/ctorrent/ctorrent.hash
@@ -1,2 +1,5 @@
 # From http://sourceforge.net/projects/dtorrent/files/dtorrent/3.3.2/
 sha1	d4e221f0292268f80e2430ce9d451dd64cf1ffaa	ctorrent-dnh3.3.2.tar.gz
+
+# locally calculated
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-- 
2.20.1
