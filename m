From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:11 -0300
Subject: [Buildroot] [PATCH 14/19] sysstat: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysstat/sysstat.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 73e20d3..02e4c88 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -9,6 +9,8 @@ SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
 SYSSTAT_DEPENDENCIES = host-gettext
+SYSSTAT_LICENSE = GPLv2+
+SYSSTAT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 SYSSTAT_DEPENDENCIES += gettext
-- 
1.8.1.5
