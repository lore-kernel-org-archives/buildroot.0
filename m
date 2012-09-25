From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 25 Sep 2012 19:18:26 +0200
Subject: [Buildroot] [PATCH v8 10/11] microperl: mark as DEPRECATED
In-Reply-To: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1348593508-14254-10-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/microperl/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/microperl/Config.in b/package/microperl/Config.in
index 66bbedd..19d104a 100644
--- a/package/microperl/Config.in
+++ b/package/microperl/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MICROPERL
 	bool "microperl"
 	# needs fork()
 	depends on BR2_USE_MMU
+	depends on BR2_DEPRECATED
 	help
 	  Perl without operating-specific functions such as readdir.
 
-- 
1.7.9.5
