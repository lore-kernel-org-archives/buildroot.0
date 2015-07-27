From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:07 +0200
Subject: [Buildroot] [PATCH 16/32] lua-messagepack: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-16-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-messagepack/lua-messagepack.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/lua-messagepack/lua-messagepack.hash

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
new file mode 100644
index 0000000..e4a442d
--- /dev/null
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	7b173f90a7d1c473aa176de8358060e5e7d312c97c5add327007bf04709e0300  lua-messagepack-0.3.3-1.src.rock
+sha256	bd7d6e02d40b53ed143a8c7222c6ae0cbb7c7fd4fafda9c5f5326423d06ea25d  lua-messagepack-lua53-0.3.3-1.src.rock
-- 
2.1.4
