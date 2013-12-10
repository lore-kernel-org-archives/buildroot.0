From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 10 Dec 2013 08:18:35 +0100
Subject: [Buildroot] [PATCH 2/2] imagemagick: unification of name major
	version variable
In-Reply-To: <1386659915-3798-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1386659915-3798-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1386659915-3798-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/imagemagick/imagemagick.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 0af5f0e..c4f6277 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMAGEMAGICK_MAJOR = 6.8.7
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-9
+IMAGEMAGICK_VERSION_MAJOR = 6.8.7
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_VERSION_MAJOR)-9
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
1.7.9.5
