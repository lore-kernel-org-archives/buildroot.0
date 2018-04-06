From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 20:06:45 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] opus-tools: update license
Message-ID: <20180407175150.03A288183A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcfc10141a1b06445d731348028cfac086348193
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

As per COPYING file, opusinfo is licensed under GPL version 2.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus-tools/opus-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index a81e75eb0e..ab00ced705 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -6,7 +6,7 @@
 
 OPUS_TOOLS_VERSION = 0.1.10
 OPUS_TOOLS_SITE = https://downloads.xiph.org/releases/opus
-OPUS_TOOLS_LICENSE = BSD-2-Clause
+OPUS_TOOLS_LICENSE = BSD-2-Clause, GPL-2.0 (opusinfo)
 OPUS_TOOLS_LICENSE_FILES = COPYING
 OPUS_TOOLS_CONF_OPTS = --disable-oggtest --disable-opustest
 OPUS_TOOLS_DEPENDENCIES = opus libogg host-pkgconf
