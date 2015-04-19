From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 11:57:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/Config.in: Sort perl-file-util
	correctly
Message-ID: <1429437426-6505-1-git-send-email-bernd.kuhls@t-online.de>
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
index 33456e1..a3cd4c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -503,8 +503,8 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
-	source "package/perl-file-util/Config.in"
 	source "package/perl-digest-hmac/Config.in"
+	source "package/perl-file-util/Config.in"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
-- 
1.7.10.4
