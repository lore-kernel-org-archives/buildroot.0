From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 13:55:48 +0100
Subject: [Buildroot] [git commit] tinyalsa: add license files
Message-ID: <20161215125823.9C45381E76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d1dddd501f1c38c950b15d9a8eabd354767fe61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyalsa/tinyalsa.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index 0edb0bc..d44155f 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -7,6 +7,7 @@
 TINYALSA_VERSION = 1.1.0
 TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3c
+TINYALSA_LICENSE_FILES = NOTICE
 TINYALSA_INSTALL_STAGING = YES
 
 define TINYALSA_BUILD_CMDS
