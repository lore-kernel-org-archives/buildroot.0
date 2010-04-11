From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:10 +0200
Subject: [Buildroot] [PATCH 14/25] Move the command-related options to a
	submenu
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b197a5ef5e969114658dc271ccd31c49b4ddc3ad.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index 430cb4f..1b717b3 100644
--- a/Config.in
+++ b/Config.in
@@ -15,6 +15,8 @@ source "target/device/Config.in"
 
 menu "Build options"
 
+menu "Commands"
+
 config BR2_WGET
 	string "Wget command"
 	default "wget --passive-ftp -nd"
@@ -67,6 +69,8 @@ config BR2_TAR_OPTIONS
 	  E.g. " -v --exclude='*.svn*'" to exclude all .svn internal files
 	  and to be verbose.
 
+endmenu
+
 config BR2_DL_DIR
 	string "Download dir"
 	default "$(TOPDIR)/dl"
-- 
1.6.3.3
