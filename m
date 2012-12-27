From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Dec 2012 12:39:09 -0300
Subject: [Buildroot] [PATCH 5/6] rng-tools: bump to version 4
In-Reply-To: <1356622750-20657-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356622750-20657-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356622750-20657-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rng-tools/rng-tools.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 347d89d..e997b15 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-RNG_TOOLS_VERSION = 3
+RNG_TOOLS_VERSION = 4
 RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
 RNG_TOOLS_CONF_ENV = LIBS="-largp"
 RNG_TOOLS_DEPENDENCIES = argp-standalone
+RNG_TOOLS_LICENSE = GPLv2
+RNG_TOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.8.6
