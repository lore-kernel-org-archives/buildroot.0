From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:05:26 +0100
Subject: [Buildroot] [git commit] package/binutils: fix comment dependencies
Message-ID: <20141207210547.19E4C8002D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6486432ec72ef663d287bc374501a4133aa87e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: re-adjust dependencies, according to Yann's comment.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 50c38b6..64d0a09 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -23,4 +23,4 @@ endif
 
 comment "binutils needs a toolchain w/ wchar"
 	depends on !BR2_aarch64 && !BR2_nios2
-	depends on BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR
