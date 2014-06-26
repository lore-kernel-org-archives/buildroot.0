From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:14 -0300
Subject: [Buildroot] [PATCH 46/53] sawman: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-46-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sawman/sawman.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 00516ca..559235f 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -10,5 +10,7 @@ SAWMAN_SITE = http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_AUTORECONF = YES
 SAWMAN_DEPENDENCIES = directfb
+SAWMAN_LICENSE = LGPLv2.1+
+SAWMAN_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
