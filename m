From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:17 +0200
Subject: [Buildroot] [PATCH 26/32] luasocket: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-26-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasocket/luasocket.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/luasocket/luasocket.hash

diff --git a/package/luasocket/luasocket.hash b/package/luasocket/luasocket.hash
new file mode 100644
index 0000000..ad91f44
--- /dev/null
+++ b/package/luasocket/luasocket.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	453fc1d0e9b6a44bbada4290d565f840a5e96ba2d1b47562ba38bd9c7e82195a  luasocket-3.0rc1-1.src.rock
-- 
2.1.4
