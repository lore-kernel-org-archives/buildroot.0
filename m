From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 23:44:04 +0200
Subject: [Buildroot] [git commit] rapidjson: update site URL in package
	description
Message-ID: <20150702214407.ABC9980E1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfce76a22123c8a8a789b85c5c14a348d5a919dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rapidjson/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rapidjson/Config.in b/package/rapidjson/Config.in
index d442797..b8c8bcf 100644
--- a/package/rapidjson/Config.in
+++ b/package/rapidjson/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_RAPIDJSON
 	help
 	  A fast JSON parser/generator for C++ with both SAX/DOM style API.
 
-	  https://code.google.com/p/rapidjson/
+	  http://rapidjson.org/
