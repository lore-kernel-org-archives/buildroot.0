From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 13:05:26 +0200
Subject: [Buildroot] [PATCH 1/2] pkgconf: update upstream URL in Config.in
Message-ID: <20170919110527.23975-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The download location got changed two years ago when the version was bumped
to 0.9.12, but the upstream URL in Config.in wasn't updated.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkgconf/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkgconf/Config.in b/package/pkgconf/Config.in
index f95847fa3c..9d5d9ab194 100644
--- a/package/pkgconf/Config.in
+++ b/package/pkgconf/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PKGCONF
 	  but was written from scratch in the summer of 2011 to replace
 	  pkg-config, which now needs itself to build itself
 
-	  https://github.com/nenolod/pkgconf
+	  https://github.com/pkgconf/pkgconf
-- 
2.11.0
