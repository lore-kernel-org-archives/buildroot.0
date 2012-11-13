From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:55 +0100
Subject: [Buildroot] [PATCH 21/30] popt: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-21-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/popt/popt.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index df49acb..fb3a766 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -7,6 +7,8 @@ POPT_VERSION = 1.16
 # rpm5.org down
 POPT_SITE = http://anduin.linuxfromscratch.org/sources/BLFS/svn/p/
 POPT_INSTALL_STAGING = YES
+POPT_LICENSE = MIT
+POPT_LICENSE_FILES = COPYING
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
-- 
1.7.10.4
