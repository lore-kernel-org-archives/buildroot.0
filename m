From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 11 Feb 2021 00:16:37 +0100
Subject: [Buildroot] [PATCH/next v1 4/7] package/odhcp6c: bump version to
 53f07e9
In-Reply-To: <20210210231640.5262-1-ps.report@gmx.net>
References: <20210210231640.5262-1-ps.report@gmx.net>
Message-ID: <20210210231640.5262-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/odhcp6c/odhcp6c.hash | 2 +-
 package/odhcp6c/odhcp6c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index 26ee711684..84d1fc4527 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c3622120b5209d1c14d5ac92884240bf0e4f652633562355e70dbf482f6c37b4  odhcp6c-f575351cbb3defc0bf52680c9082912a6c264374-br1.tar.gz
+sha256  7274a304016838483e2da48193309e5f84ca0a8a407647033283d1249eebe986  odhcp6c-53f07e90b7f1da6977143a488dd5cb73a33b233b-br1.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index c7f214ff7a..dd3a9d3e28 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ODHCP6C_VERSION = f575351cbb3defc0bf52680c9082912a6c264374
+ODHCP6C_VERSION = 53f07e90b7f1da6977143a488dd5cb73a33b233b
 ODHCP6C_SITE = https://git.openwrt.org/project/odhcp6c.git
 ODHCP6C_SITE_METHOD = git
 ODHCP6C_LICENSE = GPL-2.0
-- 
2.30.0
