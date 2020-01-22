From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:54 +0100
Subject: [Buildroot] [PATCH 22/26] package/dieharder: add hash for license
 file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-23-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/dieharder/dieharder.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dieharder/dieharder.hash b/package/dieharder/dieharder.hash
index eefe4b71de..c016f175f0 100644
--- a/package/dieharder/dieharder.hash
+++ b/package/dieharder/dieharder.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256 6cff0ff8394c553549ac7433359ccfc955fb26794260314620dfa5e4cd4b727f dieharder-3.31.1.tgz
+sha256 c475bcd1afa6fc15a65174e31c599c0d23706a34e4b9f2fcb03a4dad5438d53f  COPYING
-- 
2.20.1
