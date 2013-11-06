From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 11:59:46 +0100
Subject: [Buildroot] [git commit] curl: fix homepage
Message-ID: <20131106110601.2019182DBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62ebea18be98f1c5ed1de6ea9a801132320e54ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cURL's homepage is curl.haxx.se and not curl.haxx.nu

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 1d6d08e..8e2953e 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBCURL
 	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
 	  and Dict servers, using any of the supported protocols.
 
-	  http://curl.haxx.nu/
+	  http://curl.haxx.se/
 
 config BR2_PACKAGE_CURL
 	bool "curl binary"
