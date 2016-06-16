From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 13:43:23 +0200
Subject: [Buildroot] [git commit] sam-ba: bump to version 2.16 and add hash
	file
Message-ID: <20160616114533.3798081D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28bc00eaa0662c8c2c83ab23879e48afbc454bc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update also the file name since the pattern has changed, and add a hash
file.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
[Thomas: add hash file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sam-ba/sam-ba.hash | 2 ++
 package/sam-ba/sam-ba.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sam-ba/sam-ba.hash b/package/sam-ba/sam-ba.hash
new file mode 100644
index 0000000..61feb32
--- /dev/null
+++ b/package/sam-ba/sam-ba.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	  302734f53e471b5d1a292c9af937262f4fd766ec47ebfea62439761e7c1cd9d7	sam-ba_2.16_linux.zip
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 2a3c2a1..aede615 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 SAM_BA_SITE = http://www.atmel.com/dyn/resources/prod_documents
-SAM_BA_VERSION = 2.15
-SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION).zip
+SAM_BA_VERSION = 2.16
+SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)_linux.zip
 SAM_BA_LICENSE = BSD-like (partly binary-only)
 SAM_BA_LICENSE_FILES = doc/readme.txt
 
