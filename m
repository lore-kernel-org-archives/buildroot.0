From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jun 2016 23:33:48 +0200
Subject: [Buildroot] [git commit] opus: drop unneeded autoreconf
Message-ID: <20160613213535.DEF6B81D3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2024d9a62024ba90b83306e568feb55d113f94b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was forgotten when the patch to configure.ac was removed in 218938e470
(opus: bump version to 1.1.1).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index eb082e3..f746a2f 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -9,7 +9,6 @@ OPUS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3c
 OPUS_LICENSE_FILES = COPYING
 OPUS_INSTALL_STAGING = YES
-OPUS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
 OPUS_CONF_OPTS += --enable-fixed-point
