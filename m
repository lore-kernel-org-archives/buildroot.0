From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:46 +0100
Subject: [Buildroot] [PATCH 14/26] package/aumix: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-15-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/aumix/aumix.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/aumix/aumix.hash b/package/aumix/aumix.hash
index 0463ea01a6..dcb7a0e0c0 100644
--- a/package/aumix/aumix.hash
+++ b/package/aumix/aumix.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	d2ce43d532ef75072c8d4e7922e3bc06be6d97765a508d9ceb0d1766bbe70e29	aumix-2.9.1.tar.bz2
+sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
-- 
2.20.1
