From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 21:35:32 +0200
Subject: [Buildroot] [git commit] package/poppler: autoconf options take two
	dashes
Message-ID: <20150506193715.1F64A81DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efc9efe47efed53fb0b031fe4756a5267a95f455
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poppler/poppler.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index f8b684b..234b7cc 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -74,9 +74,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 POPPLER_DEPENDENCIES += openjpeg
-POPPLER_CONF_OPTS += -enable-libopenjpeg=openjpeg1
+POPPLER_CONF_OPTS += --enable-libopenjpeg=openjpeg1
 else
-POPPLER_CONF_OPTS += -enable-libopenjpeg=none
+POPPLER_CONF_OPTS += --enable-libopenjpeg=none
 endif
 
 $(eval $(autotools-package))
