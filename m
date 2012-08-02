From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:55:00 -0000
Subject: [Buildroot] [git commit branch/next] directfb: define license
Message-ID: <20120802195251.F27A18D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc2b6e0f8a36a153f54950a1fb791885f41b4e98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/directfb.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 071cdf4..ecea7df 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -7,6 +7,8 @@ DIRECTFB_VERSION_MAJOR = 1.4
 DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).16
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
+DIRECTFB_LICENSE = LGPLv2.1+
+DIRECTFB_LICENSE_FILES = COPYING
 DIRECTFB_AUTORECONF = YES
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_CONF_OPT = \
