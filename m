From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 16 Jan 2012 14:58:39 +0100
Subject: [Buildroot] [PATCH resend 05/22] fontconfig: removed redundant
	HOST_FOO_DEPENDENCIES
In-Reply-To: <1326722336-11759-1-git-send-email-arnout@mind.be>
References: <1326722336-11759-1-git-send-email-arnout@mind.be>
Message-ID: <1326722336-11759-6-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fontconfig/fontconfig.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index fc6ad68..39815ed 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -22,7 +22,6 @@ FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 
 FONTCONFIG_DEPENDENCIES = freetype expat
 
-HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat
 HOST_FONTCONFIG_CONF_OPT = \
 		--disable-docs \
 		--disable-static
-- 
1.7.8.3
