From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 17:20:44 +0200
Subject: [Buildroot] [git commit] dvblast: use double quotes around the
	Config.in comment
Message-ID: <20160704152244.A07A981D49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=737972178d46a92b4de4eea5289230c5f98941b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvblast/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index b9c5c14..b7f0c06 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_DVBLAST
 
 	  http://www.videolan.org/projects/dvblast.html
 
-comment 'dvblast needs a toolchain w/ NPTL'
+comment "dvblast needs a toolchain w/ NPTL"
 	depends on !BR2_bfin  # libev
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
