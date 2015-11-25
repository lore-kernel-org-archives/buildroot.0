From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 22:58:33 +0100
Subject: [Buildroot] [git commit] macchanger: add license file
Message-ID: <20151125222250.3283381EF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9327c73aa87b7ee633a29b978528cac541120d7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use the "main" source file, main.c]
Signed-off-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/macchanger/macchanger.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/macchanger/macchanger.mk b/package/macchanger/macchanger.mk
index 5ded0b8..a7ea943 100644
--- a/package/macchanger/macchanger.mk
+++ b/package/macchanger/macchanger.mk
@@ -7,5 +7,6 @@
 MACCHANGER_VERSION = 1.6.0
 MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger
 MACCHANGER_LICENSE = GPLv2+
+MACCHANGER_LICENSE_FILES = src/main.c
 
 $(eval $(autotools-package))
