From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 16:48:14 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/fping: bump version to 4.0
Message-ID: <20170528144815.29502-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please note that according to the release notes
https://github.com/schweikert/fping/releases/tag/v4.0

"fping and fping6 are now unified into one binary."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fixed subject prefix, patch is meant for next branch

 package/fping/fping.hash | 2 +-
 package/fping/fping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
index 8c1909ed9..e97709ca1 100644
--- a/package/fping/fping.hash
+++ b/package/fping/fping.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	2f753094e4df3cdb1d99be1687c0fb7d2f14c0d526ebf03158c8c5519bc78f54	fping-3.16.tar.gz
+sha256 67eb4152b98ad34f99d2eec4e1098a0bb52caf13c0c89cd147349d08190fe8ce  fping-4.0.tar.gz
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index 5970d6379..5af46c67f 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 3.16
+FPING_VERSION = 4.0
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
-- 
2.11.0
