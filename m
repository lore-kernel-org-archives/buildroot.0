From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sat, 31 Mar 2018 00:29:15 +0530
Subject: [Buildroot] [PATCH 4/4] opus-tools: update license
In-Reply-To: <1522436355-5697-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1522436355-5697-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1522436355-5697-4-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As per COPYING file, opusinfo is licensed under GPL version 2.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/opus-tools/opus-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index a81e75e..ab00ced 100644
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
-- 
2.7.4
