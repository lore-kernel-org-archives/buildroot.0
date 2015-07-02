From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed,  1 Jul 2015 22:59:12 -0400
Subject: [Buildroot] [PATCH 2/2] rapidjson: update site URL in package
	description
In-Reply-To: <1435805952-2512-1-git-send-email-danomimanchego123@gmail.com>
References: <1435805952-2512-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1435805952-2512-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/rapidjson/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rapidjson/Config.in b/package/rapidjson/Config.in
index d442797..b8c8bcf 100644
--- a/package/rapidjson/Config.in
+++ b/package/rapidjson/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_RAPIDJSON
 	help
 	  A fast JSON parser/generator for C++ with both SAX/DOM style API.
 
-	  https://code.google.com/p/rapidjson/
+	  http://rapidjson.org/
-- 
1.7.9.5
