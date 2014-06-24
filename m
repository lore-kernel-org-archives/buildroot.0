From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:45 -0300
Subject: [Buildroot] [PATCH 39/54] statserial: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-39-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/statserial/statserial.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index 25989bc..e59267a 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -7,6 +7,8 @@
 STATSERIAL_VERSION = 1.1
 STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial/
 STATSERIAL_DEPENDENCIES = ncurses
+STATSERIAL_LICENSE = GPLv2+
+STATSERIAL_LICENSE_FILES = COPYING
 
 define STATSERIAL_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
-- 
1.8.5.5
