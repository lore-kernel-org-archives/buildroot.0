From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 14:26:54 +0200
Subject: [Buildroot] [git commit] e2fsprogs: add missing arch depends to
	comment
Message-ID: <20170422122658.AFD5B8215D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6d7be83bea93629f766a1ca4f77869701525f9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index da6aacf..c83f845 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -51,6 +51,7 @@ config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
 
 comment "e4defrag needs a glibc or musl toolchain"
+	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
