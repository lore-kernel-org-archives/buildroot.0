From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Oct 2019 09:49:06 +0200
Subject: [Buildroot] [git commit] package/caps: fix license string
Message-ID: <20191017074408.22646821BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8a2e96a78c381b23606cce10b36e92f984d4374
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The correct license string is `GPL-3.0+` not `GPLv3`.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/caps/caps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/caps/caps.mk b/package/caps/caps.mk
index c4e94543a6..e307a689e0 100644
--- a/package/caps/caps.mk
+++ b/package/caps/caps.mk
@@ -7,7 +7,7 @@
 CAPS_VERSION = 0.9.26
 CAPS_SOURCE = caps_$(CAPS_VERSION).tar.bz2
 CAPS_SITE = http://quitte.de/dsp
-CAPS_LICENSE = GPLv3
+CAPS_LICENSE = GPL-3.0+
 CAPS_LICENSE_FILES = COPYING
 
 # Need to pass TARGET_CONFIGURE_OPTS in the environment to not
