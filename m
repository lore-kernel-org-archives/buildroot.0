From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 Jan 2015 17:42:34 +0000
Subject: [Buildroot] [PATCH 2/2] fluxbox: bump version to 1.3.6
In-Reply-To: <1420566154-43239-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1420566154-43239-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1420566154-43239-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 1.3.6
- Update the hash value

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/fluxbox/fluxbox.hash |    2 +-
 package/fluxbox/fluxbox.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluxbox/fluxbox.hash b/package/fluxbox/fluxbox.hash
index 710798d..bfbbd7f 100644
--- a/package/fluxbox/fluxbox.hash
+++ b/package/fluxbox/fluxbox.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  164dd7bf59791d09a1e729a4fcd5e7347a1004ba675629860a5cf1a271c32983  fluxbox-1.3.5.tar.bz2
+sha256  05cc2149b79155121cb0fff6d4fd0289e3edb669390714e0b54071bec987e686  fluxbox-1.3.6.tar.bz2
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 31699d5..0340465 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUXBOX_VERSION = 1.3.5
+FLUXBOX_VERSION = 1.3.6
 FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
 FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBOX_VERSION)
 FLUXBOX_LICENSE = MIT
-- 
1.7.1
