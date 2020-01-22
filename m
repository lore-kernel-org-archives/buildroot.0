From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:45 +0100
Subject: [Buildroot] [PATCH 13/26] package/cgic: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-14-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/cgic/cgic.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cgic/cgic.hash b/package/cgic/cgic.hash
index fa1d0bc95c..d3f082e888 100644
--- a/package/cgic/cgic.hash
+++ b/package/cgic/cgic.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 1e8834642a4b89528bb7bde2f287e133c6b07e210e68681a34137c436d59d320  cgic207.tar.gz
+sha256 6a7de92593d64dbf7630d8f66f97e04a899769bef1e055f2434bc06b87b9de62  license.txt
-- 
2.20.1
