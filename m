From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:11:39 +0100
Subject: [Buildroot] [git commit] uhttpd: bump version
Message-ID: <20170325141449.981EC82189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d604bca2dfd3ecef48733283146d28796a9ba403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uhttpd/uhttpd.hash | 2 +-
 package/uhttpd/uhttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index bfeb557..7e09f18 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 b01aec584daaa367b85eddd950da27e3a41bcb265507cf42f79ff2ebcf0972d4  uhttpd-59e0c739634f46a164d939e54416287b91ff8a9b.tar.gz
+sha256 9325c95c9bb1c51bf135700a65738884fa9cd548ff8166c8b61fdbf99825cd6d  uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82.tar.gz
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
index be0d7d6..cc7649d 100644
--- a/package/uhttpd/uhttpd.mk
+++ b/package/uhttpd/uhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHTTPD_VERSION = 59e0c739634f46a164d939e54416287b91ff8a9b
+UHTTPD_VERSION = a8bf9c00842224edb394e79909053f7628ee6a82
 UHTTPD_SITE = http://git.openwrt.org/project/uhttpd.git
 UHTTPD_SITE_METHOD = git
 UHTTPD_LICENSE = ISC
