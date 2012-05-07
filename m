From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:36 +0200
Subject: [Buildroot] [PATCH v3 15/22] directfb: define license
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-15-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/directfb/directfb.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 7aa0398..d0d8421 100644
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
-- 
1.7.5.4
