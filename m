From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 24 May 2013 16:43:02 -0700
Subject: [Buildroot] [PATCH 2/2] pptp-linux: add license information
In-Reply-To: <1369438982-1398-1-git-send-email-gilles.talis@gmail.com>
References: <1369438982-1398-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1369438982-1398-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/pptp-linux/pptp-linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index ded2a19..ef25c9a 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -8,6 +8,8 @@ PPTP_LINUX_VERSION = 1.7.2
 PPTP_LINUX_SITE = http://downloads.sourceforge.net/project/pptpclient/pptp/pptp-$(PPTP_LINUX_VERSION)
 PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
 PPTP_LINUX_MAKE = $(MAKE1)
+PPTP_LINUX_LICENSE = GPLv2+
+PPTP_LINUX_LICENSE_FILES = COPYING
 
 define PPTP_LINUX_BUILD_CMDS
 	$(MAKE) -C $(@D) OPTIMIZE= DEBUG= \
-- 
1.7.4.1
