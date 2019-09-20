From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 20 Sep 2019 12:43:43 +0000
Subject: [Buildroot] [PATCH 8/9] package/tinyxml: add missing hash for
 README file
In-Reply-To: <20190920124242.22479-1-nicolas.carrier@orolia.com>
References: <20190920124242.22479-1-nicolas.carrier@orolia.com>
Message-ID: <20190920124242.22479-9-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/tinyxml/tinyxml.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyxml/tinyxml.hash b/package/tinyxml/tinyxml.hash
index 6aa37d9de3..650a3b227e 100644
--- a/package/tinyxml/tinyxml.hash
+++ b/package/tinyxml/tinyxml.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	8164c9ad48b9028667768a584d62f7760cfbfb90d0dd6214ad174403058da10c	tinyxml-2.6.2_2.tar.gz
+sha256	a65b8363834ccbe31ab7b49dcba723ed204622df30326793e0121435624c1a8d	README
-- 
2.20.1
