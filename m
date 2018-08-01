From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  1 Aug 2018 14:57:18 +0200
Subject: [Buildroot] [PATCH 1/4] minicom: update package to use git
 repository.
In-Reply-To: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
References: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180801125721.34654-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minicom is now hosted on a git repository:
https://salsa.debian.org/minicom-team/minicom.git

Change package to use git method pointing to last commit.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/minicom/minicom.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index cb06482379..1a3426899f 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.7.1
-MINICOM_SITE = https://alioth.debian.org/frs/download.php/file/4215
+MINICOM_VERSION = 0e79d0bb731a16a3126d926740f923bcb6ecd738
+MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
+MINICOM_SITE_METHOD = git
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
 
-- 
2.17.1
