From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:37:06 +0100
Subject: [Buildroot] [PATCH 31/31] package/zlib: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-32-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/zlib/zlib.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zlib/zlib.hash b/package/zlib/zlib.hash
index 81cb64ef62..30271a6790 100644
--- a/package/zlib/zlib.hash
+++ b/package/zlib/zlib.hash
@@ -1,2 +1,4 @@
 # From http://www.zlib.net/
 sha256 4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
+# Locally computed
+sha256 7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15  README
-- 
2.15.0
