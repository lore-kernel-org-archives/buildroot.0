From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 21:49:48 +0200
Subject: [Buildroot] [git commit branch/next] sam-ba: bump version to 2.12
Message-ID: <20120802195306.56BD08F456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9240163ef7e1f10cdbecfc5a6936d5624f823565
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sam-ba/sam-ba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 9f39347..067bdf1 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -1,5 +1,5 @@
 SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
-SAM_BA_VERSION = 2.11
+SAM_BA_VERSION = 2.12
 SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
 
 define HOST_SAM_BA_EXTRACT_CMDS
