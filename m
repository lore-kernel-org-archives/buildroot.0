From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 17 Oct 2016 22:31:32 +0530
Subject: [Buildroot] [PATCH 2/2] openswan: remove duplicate word toolchain
	from comment
In-Reply-To: <1476723692-22814-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1476723692-22814-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1476723692-22814-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/openswan/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index ba5d53d..5db665c 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_OPENSWAN
 
 	  http://www.openswan.org
 
-comment "openswan needs a uClibc or glibc toolchain toolchain w/ headers >= 3.0"
+comment "openswan needs a uClibc or glibc toolchain w/ headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || \
 		BR2_TOOLCHAIN_USES_MUSL
-- 
2.6.2
