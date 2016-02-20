From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 19:21:23 +0100
Subject: [Buildroot] [git commit branch/next] erlang-p1-utils: bump to
	version 1.0.3
Message-ID: <20160220182140.5F55D7F9FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6373adea3fa3863b5c467c8a5a0c427772733234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-utils/erlang-p1-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index c01d6d5..733cf87 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ERLANG_P1_UTILS_VERSION = 1bf99f9
+ERLANG_P1_UTILS_VERSION = 1.0.3
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
 ERLANG_P1_UTILS_LICENSE = GPLv2+
-ERLANG_P1_UTILS_LICENSE_FILES = COPYING
+ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_UTILS_INSTALL_STAGING = YES
 
 $(eval $(rebar-package))
