From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2015 22:27:16 -0000
Subject: [Buildroot] [git commit] glibc: set version 2.20 as default
Message-ID: <20150302222715.982578057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d15b3df04e78515907575cc4087dc28fcb200c70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 37e108e..890d007 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_GLIBC
 
 choice
 	prompt "glibc version"
-	default BR2_GLIBC_VERSION_2_19
+	default BR2_GLIBC_VERSION_2_20
 
 config BR2_GLIBC_VERSION_2_19
 	bool "2.19"
