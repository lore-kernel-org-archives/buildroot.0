From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:39 +0100
Subject: [Buildroot] [PATCH 07/26] package/atest: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-8-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/atest/atest.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/atest/atest.hash b/package/atest/atest.hash
index 78e3ff8ede..8384f31791 100644
--- a/package/atest/atest.hash
+++ b/package/atest/atest.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 91da5a6d4d0b0a8d4bae156a40e91a6dccf62863bfa7acae948efbbd2b4154ca  atest-895b0183a89c15f5e2305a6795bb1667753cd3f0.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
-- 
2.20.1
