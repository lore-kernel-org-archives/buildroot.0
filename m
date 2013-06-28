From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:07 -0300
Subject: [Buildroot] [PATCH 10/19] fbterm: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fbterm/fbterm.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index 6fc4d7f..7e9d324 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 FBTERM_VERSION = 1.7.0
-FBTERM_SITE = http://fbterm.googlecode.com/files/
-
+FBTERM_SITE = http://fbterm.googlecode.com/files
+FBTERM_LICENSE = GPLv2+
+FBTERM_LICENSE_FILES = COPYING
 FBTERM_DEPENDENCIES = fontconfig liberation
 
 $(eval $(autotools-package))
-- 
1.8.1.5
