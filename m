From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:04 -0300
Subject: [Buildroot] [PATCH 36/53] lpc3250loader: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-36-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lpc3250loader/lpc3250loader.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index 42beb7b..d13ab40 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -6,6 +6,8 @@
 
 HOST_LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
 HOST_LPC3250LOADER_VERSION = 1.0
+LPC3250LOADER_LICENSE = GPLv2+
+LPC3250LOADER_LICENSE_FILES = LPC3250loader.py
 
 define HOST_LPC3250LOADER_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/LPC3250loader.py \
-- 
1.8.5.5
