From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 15:13:07 +0100
Subject: [Buildroot] [git commit branch/next] sam-ba: patch to latest version
Message-ID: <20131128141416.1C82C9BE12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=874f5f92ea5b210ab54c624eb4e6fc076e67124a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Apply the latest Atmel patch for sam-ba version 2.12

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sam-ba/sam-ba.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 8e24fa6..4dc0568 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -7,6 +7,7 @@
 SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
 SAM_BA_VERSION = 2.12
 SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
+SAM_BA_PATCH = sam-ba_$(SAM_BA_VERSION)_patch5.gz
 SAM_BA_LICENSE = BSD-like (partly binary-only)
 SAM_BA_LICENSE_FILES = doc/readme.txt
 
