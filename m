From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:38:47 +0200
Subject: [Buildroot] [git commit] package/nginx-naxsi: add missing pcre
	dependency
Message-ID: <20160912203953.4153981979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=218dfdd9038af882a02fe64f13a533c8ce75ddc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/9c7/9c7bad6831b09251af81e2bbfc595a241df87c70/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx-naxsi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
index 2f7c2da..6c175eb 100644
--- a/package/nginx-naxsi/Config.in
+++ b/package/nginx-naxsi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGINX_NAXSI
 	bool "nginx-naxsi"
+	select BR2_PACKAGE_PCRE
 	help
 	  NAXSI means Nginx Anti XSS & SQL Injection.
 
