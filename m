From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 14 Apr 2017 14:13:41 +0200
Subject: [Buildroot] [PATCH 1/5] package/efl: remove lefover disable-wayland
	option
Message-ID: <20170414121345.10026-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wayland support was re-added by [1] but the --disable-wayland option
was not removed from EFL_CONF_OPTS.

[1] f30eec41f95ed99909eb2c7590d83c12b9142df2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/efl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 3644000..8772871 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -44,7 +44,6 @@ EFL_CONF_OPTS = \
 	--disable-sdl \
 	--disable-spectre \
 	--disable-xinput22 \
-	--disable-wayland \
 	--enable-liblz4 \
 	--with-doxygen=no
 
-- 
2.9.3
