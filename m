From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 22:34:02 +0200
Subject: [Buildroot] [git commit] package/efl: remove leftover
	disable-wayland option
Message-ID: <20170414203413.C70788271A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=577f5ba592e50349e35b9066d7b6ea572d008562
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wayland support was re-added by [1] but the --disable-wayland option
was not removed from EFL_CONF_OPTS.

[1] f30eec41f95ed99909eb2c7590d83c12b9142df2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
