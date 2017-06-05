From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 18:22:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/x264: bump version
In-Reply-To: <20170605162238.8413-1-bernd.kuhls@t-online.de>
References: <20170605162238.8413-1-bernd.kuhls@t-online.de>
Message-ID: <20170605162238.8413-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x264/x264.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index d1bc76701..69ec4ccea 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = 97eaef2ab82a46d13ea5e00270712d6475fbe42b
+X264_VERSION = df79067c0cf33da712d344b5f8869be7eaf326f3
 X264_SITE = git://git.videolan.org/x264.git
 X264_LICENSE = GPL-2.0+
 X264_DEPENDENCIES = host-pkgconf
-- 
2.11.0
