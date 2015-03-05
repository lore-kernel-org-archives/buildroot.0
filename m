From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 5 Mar 2015 10:05:17 +0000
Subject: [Buildroot] [PATCH] mipsel-ctng-linux-uclibc.config: add
	BR2_TOOLCHAIN_EXTERNAL_CXX=y
Message-ID: <1425549917-31392-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This external toolchain has C++ support, so add
BR2_TOOLCHAIN_EXTERNAL_CXX=y to the config file.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../configs/mipsel-ctng-linux-uclibc.config        |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/web/toolchains/configs/mipsel-ctng-linux-uclibc.config b/web/toolchains/configs/mipsel-ctng-linux-uclibc.config
index c6ad9fb..d0ac37e 100644
--- a/web/toolchains/configs/mipsel-ctng-linux-uclibc.config
+++ b/web/toolchains/configs/mipsel-ctng-linux-uclibc.config
@@ -8,3 +8,4 @@ BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
 BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
 BR2_TOOLCHAIN_EXTERNAL_WCHAR=y
 BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
-- 
1.7.1
