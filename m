From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:38:28 +0200
Subject: [Buildroot] [git commit] openswan: remove duplicate word toolchain
	from comment
Message-ID: <20161019213948.EDAE980AC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d6d365190dcef1c4a2de4e462f46733b555e499
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
