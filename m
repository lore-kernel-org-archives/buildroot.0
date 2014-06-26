From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:36 -0300
Subject: [Buildroot] [PATCH 08/53] elftosb: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/elftosb/elftosb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index 9b825a0..ac9aa32 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -6,6 +6,8 @@
 
 ELFTOSB_VERSION = 10.12.01
 ELFTOSB_SITE = http://repository.timesys.com/buildsources/e/elftosb/elftosb-$(ELFTOSB_VERSION)
+ELFTOSB_LICENSE = BSD-3c
+ELFTOSB_LICENSE_FILES = COPYING
 
 define HOST_ELFTOSB_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
-- 
1.8.5.5
