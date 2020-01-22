From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:47 +0100
Subject: [Buildroot] [PATCH 15/26] package/cpuload: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-16-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/cpuload/cpuload.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cpuload/cpuload.hash b/package/cpuload/cpuload.hash
index 2a32283500..b80879ca7d 100644
--- a/package/cpuload/cpuload.hash
+++ b/package/cpuload/cpuload.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 1d61f4776dc3e2746343d68b2ea2faf138e54666b630a6060df4f3945badbcae  cpuload-0.3.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-- 
2.20.1
