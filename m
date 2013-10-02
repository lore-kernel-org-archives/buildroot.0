From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 09:50:12 +0200
Subject: [Buildroot] [git commit] vala: add license info
Message-ID: <20131002080114.E37879B913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43a840463bf93700a2066b2cf858769562444d3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vala/vala.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index aed02fa..8dc887b 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -9,6 +9,8 @@ VALA_VERSION_MINOR = 1
 VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
+VALA_LICENSE = LGPLv2.1+
+VALA_LICENSE_FILES = COPYING
 
 VALA_DEPENDENCIES = host-flex host-bison libglib2 \
 		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
