From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Sep 2012 08:43:33 +0200
Subject: [Buildroot] [git commit] wireless_tools: add license information
Message-ID: <20120921093725.71E749968E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5f0fdc66b9a7606f6b789d43496fe9351586ac2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wireless_tools/wireless_tools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index d81aa7c..f355689 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -7,6 +7,8 @@
 WIRELESS_TOOLS_VERSION = 29
 WIRELESS_TOOLS_SITE = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
 WIRELESS_TOOLS_SOURCE = wireless_tools.$(WIRELESS_TOOLS_VERSION).tar.gz
+WIRELESS_TOOLS_LICENSE = GPLv2
+WIRELESS_TOOLS_LICENSE_FILES = COPYING
 WIRELESS_TOOLS_INSTALL_STAGING = YES
 
 WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
