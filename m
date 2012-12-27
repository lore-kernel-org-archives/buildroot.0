From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Dec 2012 18:56:12 +0100
Subject: [Buildroot] [git commit] rng-tools: bump to version 4
Message-ID: <20121227175705.5F4EA9A4B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2529f7f4d18b18dac1ee00ac7655116cb805818
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
