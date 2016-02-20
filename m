From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 18:41:39 +0100
Subject: [Buildroot] [git commit] erlang-p1-iconv: bump to version 0.9.0
Message-ID: <20160302202754.9BC3180203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a42e850b05341a5883fd2d3af85ba90898b0872c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-iconv/erlang-p1-iconv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
index 2189f01..d2d2626 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ICONV_VERSION = dff5ee5
+ERLANG_P1_ICONV_VERSION = 0.9.0
 ERLANG_P1_ICONV_SITE = $(call github,processone,eiconv,$(ERLANG_P1_ICONV_VERSION))
 ERLANG_P1_ICONV_LICENSE = GPLv2+
 ERLANG_P1_ICONV_LICENSE_FILES = COPYING
