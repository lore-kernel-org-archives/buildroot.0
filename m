From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Jan 2012 03:32:20 +0100
Subject: [Buildroot] [PATCH 1/3] xproto_glproto: bump version to 1.4.14
In-Reply-To: <1327113142-19610-1-git-send-email-arnout@mind.be>
References: <CAPeX=+tVeJ6wip9tXgte5-8+qFqdxGNPU4NfyrdPs-a7fS8gsg@mail.gmail.com>
 <1327113142-19610-1-git-send-email-arnout@mind.be>
Message-ID: <1327113142-19610-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xproto_glproto/xproto_glproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index d5816cd..36e74a6 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_GLPROTO_VERSION = 1.4.10
+XPROTO_GLPROTO_VERSION = 1.4.14
 XPROTO_GLPROTO_SOURCE = glproto-$(XPROTO_GLPROTO_VERSION).tar.bz2
 XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_GLPROTO_INSTALL_STAGING = YES
-- 
1.7.8.3
