From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:04 -0300
Subject: [Buildroot] [PATCH 07/19] dstat: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dstat/dstat.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index de0f0a8..e71b0cc 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -7,6 +7,8 @@
 DSTAT_VERSION = 0.7.2
 DSTAT_SOURCE = dstat-$(DSTAT_VERSION).tar.bz2
 DSTAT_SITE = http://dag.wieers.com/home-made/dstat
+DSTAT_LICENSE = GPLv2
+DSTAT_LICENSE_FILES = COPYING
 
 define DSTAT_INSTALL_TARGET_CMDS
        $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-- 
1.8.1.5
