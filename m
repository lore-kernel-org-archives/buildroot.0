From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 10:20:44 +0200
Subject: [Buildroot] [git commit] fan-ctrl: use .c file as license file
Message-ID: <20140702090135.9CD2F9D145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc61bda9f8190e90b131367845b85f389dc5c958
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fan-ctrl/fan-ctrl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
index 6b361db..2e8a6b0 100644
--- a/package/fan-ctrl/fan-ctrl.mk
+++ b/package/fan-ctrl/fan-ctrl.mk
@@ -9,6 +9,7 @@ FAN_CTRL_VERSION = 1.3
 FAN_CTRL_SOURCE = fan-ctrl.c?revision=$(FAN_CTRL_VERSION)
 FAN_CTRL_SITE = http://fan-ctrl.cvs.sourceforge.net/viewvc/fan-ctrl/fan-ctrl/
 FAN_CTRL_LICENSE = GPLv2+
+FAN_CTRL_LICENSE_FILES = fan-ctrl.c
 
 define FAN_CTRL_EXTRACT_CMDS
 	cp $(DL_DIR)/$(FAN_CTRL_SOURCE) $(@D)/fan-ctrl.c
