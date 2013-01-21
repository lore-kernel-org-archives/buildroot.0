From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 09:18:04 +0100
Subject: [Buildroot] [git commit] directfb: drop unneeded AUTORECONF
Message-ID: <20130121082023.9DE178047D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c60b67320f31cbc77727ceb7273311611a2a9b89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hasn't been needed since d1defbf39 (bump to version 1.4.11).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 0df866f..6d5b1ce 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -9,7 +9,6 @@ DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSI
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPLv2.1+
 DIRECTFB_LICENSE_FILES = COPYING
-DIRECTFB_AUTORECONF = YES
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_CONF_OPT = \
 	--localstatedir=/var \
