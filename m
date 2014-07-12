From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jul 2014 14:31:00 +0200
Subject: [Buildroot] [git commit] gettext: bump to version 0.19.1
Message-ID: <20140712123246.9B3239C693@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f488e2efd86a57ea72156836e2611253456cdb39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index cc461f7..9d5d9f3 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.18.3.2
+GETTEXT_VERSION = 0.19.1
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
