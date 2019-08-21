From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 21 Aug 2019 23:39:55 +0200
Subject: [Buildroot] [git commit branch/next] package/uclibc: remove
 UCLIBC_LARGEFILE_CONFIG
Message-ID: <20190821213725.9223983928@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7935a754592ee1018981c94fe3e56d20bff705b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

UCLIBC_LARGEFILE_CONFIG was removed with the bump to uClibc-ng
1.0.20 (commit a44d7f2dbb19a54a8f2beb5c0f0adb0680999319)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uclibc/uclibc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index afc4872b65..b9ed8b9290 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -388,7 +388,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_X86_TYPE_CONFIG)
 	$(UCLIBC_DEBUG_CONFIG)
 	$(UCLIBC_ENDIAN_CONFIG)
-	$(UCLIBC_LARGEFILE_CONFIG)
 	$(UCLIBC_IPV6_CONFIG)
 	$(UCLIBC_FLOAT_CONFIG)
 	$(UCLIBC_SSP_CONFIG)
