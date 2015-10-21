From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 21 Oct 2015 10:30:13 +0100
Subject: [Buildroot] [PATCH 1/3] minicom: switch to the official site
Message-ID: <1445419815-24985-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We switched to our mirror because because the official site started to
fail, but now it works again.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/minicom/minicom.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index dd05741..26e9cef 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MINICOM_VERSION = 2.7
-MINICOM_SITE = http://sources.buildroot.net
+MINICOM_SITE = https://alioth.debian.org/frs/download.php/file/3977
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
-- 
1.7.1
