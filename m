From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jun 2018 16:19:52 +0200
Subject: [Buildroot] [git commit] libjpeg: use SPDX short identifier
Message-ID: <20180601144051.0C33D7FF2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1350678212495925e9800772a82ed6a5894d2da7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use IJG instead of jpeg-license

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjpeg/libjpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index edda2a5a1b..ab09881fc1 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -7,7 +7,7 @@
 LIBJPEG_VERSION = 9c
 LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
-LIBJPEG_LICENSE = jpeg-license (BSD-3-Clause-like)
+LIBJPEG_LICENSE = IJG
 LIBJPEG_LICENSE_FILES = README
 LIBJPEG_INSTALL_STAGING = YES
 LIBJPEG_PROVIDES = jpeg
