From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jan 2011 15:55:19 -0300
Subject: [Buildroot] [PATCH] sysstat: bump to version 9.1.7
In-Reply-To: <1294858519-25636-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294858519-25636-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294858519-25636-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes some new metrics for sar (amount of active and inactive memory,
processes blocked waiting for I/O to complete).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysstat/sysstat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index c5fe5c9..09e5177 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SYSSTAT_VERSION = 9.1.6
+SYSSTAT_VERSION = 9.1.7
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
-- 
1.7.3.4
