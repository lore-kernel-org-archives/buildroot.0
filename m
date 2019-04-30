From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 14:40:11 +0200
Subject: [Buildroot] [git commit] package/tpm2-totp: fix menu prompt
Message-ID: <20190430123739.797D083B69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06e46d9b0520fafbd5883519e91f6527d987c80b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It must be "tpm2-totp", not "tpm2-tools" (probably a copy/paste issue).

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-totp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-totp/Config.in b/package/tpm2-totp/Config.in
index 0dbbdea228..dcadf5a5f2 100644
--- a/package/tpm2-totp/Config.in
+++ b/package/tpm2-totp/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_TPM2_TOTP
-	bool "tpm2-tools"
+	bool "tpm2-totp"
 	depends on !BR2_STATIC_LIBS # tpm2-tss
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # glibc < 2.20
 	select BR2_PACKAGE_LIBQRENCODE
