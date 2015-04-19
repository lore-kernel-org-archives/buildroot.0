From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:38:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/Config.in: Sort perl-file-util
	correctly
Message-ID: <1429432736-17150-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index e2c5c3f..f15614e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -503,10 +503,10 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
-	source "package/perl-file-util/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-encode-locale/Config.in"
 	source "package/perl-file-listing/Config.in"
+	source "package/perl-file-util/Config.in"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
-- 
1.7.10.4
