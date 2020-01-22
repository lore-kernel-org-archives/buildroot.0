From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:51 +0100
Subject: [Buildroot] [PATCH 19/26] package/daemon: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-20-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/daemon/daemon.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
index 32308ea3f7..ad8637ee81 100644
--- a/package/daemon/daemon.hash
+++ b/package/daemon/daemon.hash
@@ -1,3 +1,4 @@
 # md5 from http://www.libslack.org/daemon/; sha256 locally calculated
 md5 6cd0a28630a29ac279bc501f39baec66 daemon-0.6.4.tar.gz
 sha256 c4b9ea4aa74d55ea618c34f1e02c080ddf368549037cb239ee60c83191035ca1 daemon-0.6.4.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 LICENSE
-- 
2.20.1
