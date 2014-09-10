From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Sep 2014 10:56:12 +0200
Subject: [Buildroot] [git commit] file: mention the browser friendly homepage
Message-ID: <20140910085707.733CF9D651@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7b24186cf948dc7f2c299c2c0054d68ff4d0ad1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/file/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/file/Config.in b/package/file/Config.in
index dede331..13934b2 100644
--- a/package/file/Config.in
+++ b/package/file/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_FILE
 	  Program to identify a file's format by scanning binary data
 	  for known patterns.
 
-	  ftp://ftp.astron.com/pub/file/
+	  http://www.darwinsys.com/file/
