From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jan 2014 23:36:35 +0100
Subject: [Buildroot] [git commit] package/ola: bump to 0.8.33
Message-ID: <20140114223903.EC4AB9C4C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=573aa4b95414b17805c51370e96e1a9c5fb3091c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ola/ola.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 542aa77..843ec0b 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OLA_VERSION = 0.8.32
+OLA_VERSION = 0.8.33
 OLA_SITE = https://open-lighting.googlecode.com/files
 
 OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
