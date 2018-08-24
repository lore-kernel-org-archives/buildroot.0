From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 11:59:21 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] wireless_tools: Fix site
 URL does not work
Message-ID: <20180824095139.7F3998A351@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d065747168308299cf0326189ffb66ae236e16d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Replace broken http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
by https://hewlettpackard.github.io/wireless-tools.

[Peter: also adjust URL in Config.in]
Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 052d3cbb0ea6aec7123b8595780d6f819dc7c925)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireless_tools/Config.in         | 2 +-
 package/wireless_tools/wireless_tools.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
index e33af25b86..349908dbde 100644
--- a/package/wireless_tools/Config.in
+++ b/package/wireless_tools/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_WIRELESS_TOOLS
 	help
 	  A collection of tools to configure wireless lan cards.
 
-	  http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html
+	  https://hewlettpackard.github.io/wireless-tools/
 
 if BR2_PACKAGE_WIRELESS_TOOLS
 
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 51320a9b25..b87ab20fb2 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -6,7 +6,7 @@
 
 WIRELESS_TOOLS_VERSION_MAJOR = 30
 WIRELESS_TOOLS_VERSION = $(WIRELESS_TOOLS_VERSION_MAJOR).pre9
-WIRELESS_TOOLS_SITE = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
+WIRELESS_TOOLS_SITE = https://hewlettpackard.github.io/wireless-tools
 WIRELESS_TOOLS_SOURCE = wireless_tools.$(WIRELESS_TOOLS_VERSION).tar.gz
 WIRELESS_TOOLS_LICENSE = GPL-2.0
 WIRELESS_TOOLS_LICENSE_FILES = COPYING
