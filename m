From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 23 Jan 2020 08:00:14 +0100
Subject: [Buildroot] [PATCH v2 24/26] package/autoconf-archive: add hash for
 license file
Message-ID: <20200123070014.12654-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/autoconf-archive/autoconf-archive.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index fadda54e86..3ef98f2f14 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,2 +1,4 @@
 # Computed locally
 sha256 17195c833098da79de5778ee90948f4c5d90ed1a0cf8391b4ab348e2ec511e3f  autoconf-archive-2019.01.06.tar.xz
+sha256 e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
+sha256 23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
-- 
2.20.1
