From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:35 -0300
Subject: [Buildroot] [PATCH 07/53] eeprog: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/eeprog/eeprog.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index e1dd9b5..93aeb5e 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -6,6 +6,8 @@
 
 EEPROG_VERSION = 0.7.6
 EEPROG_SITE = http://www.codesink.org/download
+EEPROG_LICENSE = GPLv2+
+EEPROG_LICENSE_FILES = eeprog.c
 
 define EEPROG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
1.8.5.5
