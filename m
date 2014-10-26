From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:23 +0100
Subject: [Buildroot] [PATCH 17/51] linenoise: bump version and license
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-17-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project now comes with a LICENSE_FILES.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/linenoise/linenoise.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index aff0c7d..7321564 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = 828b9dacc52d4ad5a15c89be8fb8691d224f9a4f
+LINENOISE_VERSION = cf1bdf5f89e10b504a0bec3efc8a8587eadecd2c
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2c
+LINENOISE_LICENSE_FILES = LICENSE
 LINENOISE_INSTALL_STAGING = YES
 # Static library only, nothing to install on target
 LINENOISE_INSTALL_TARGET = NO
-- 
2.1.1
