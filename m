From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:40 +0100
Subject: [Buildroot] [PATCH 08/26] package/atf: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-9-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/atf/atf.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/atf/atf.hash b/package/atf/atf.hash
index 78cd3c6828..8a8092e5a6 100644
--- a/package/atf/atf.hash
+++ b/package/atf/atf.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 92bc64180135eea8fe84c91c9f894e678767764f6dbc8482021d4dde09857505 atf-0.21.tar.gz
+sha256 2a15172ddf6386297734c9800c899e6e8dc16c5a03931dcf95a9ab321a24cfe4  COPYING
-- 
2.20.1
