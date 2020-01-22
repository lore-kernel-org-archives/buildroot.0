From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:34 +0100
Subject: [Buildroot] [PATCH 02/26] package/netcat: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/netcat/netcat.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netcat/netcat.hash b/package/netcat/netcat.hash
index e20c4c297a..d591f3d666 100644
--- a/package/netcat/netcat.hash
+++ b/package/netcat/netcat.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  30719c9a4ffbcf15676b8f528233ccc54ee6cba96cb4590975f5fd60c68a066f  netcat-0.7.1.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-- 
2.20.1
