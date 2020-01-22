From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:42 +0100
Subject: [Buildroot] [PATCH 10/26] package/bcache-tools: add hash for
 license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-11-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/bcache-tools/bcache-tools.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bcache-tools/bcache-tools.hash b/package/bcache-tools/bcache-tools.hash
index 4213705f35..d80ec44a73 100644
--- a/package/bcache-tools/bcache-tools.hash
+++ b/package/bcache-tools/bcache-tools.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 d56923936f37287efc57a46315679102ef2c86cd0be5874590320acd48c1201c  bcache-tools-1.0.8.tar.gz
+sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
-- 
2.20.1
