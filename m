From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:58 +0100
Subject: [Buildroot] [PATCH 26/26] package/axel: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-27-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/axel/axel.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index e7c128ed76..f9c5526f88 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1 +1,3 @@
+# locally computed
 sha256 24ab549021bdfca01ad5e8e95b706869dd30fe9ab1043da4cbb9dff89edc267d  axel-2.17.6.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-- 
2.20.1
