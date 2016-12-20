From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 19 Dec 2016 22:13:16 -0500
Subject: [Buildroot] [PATCH 1/1] mkusers: fix spelling in intro comment
Message-ID: <1482203596-5794-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 support/scripts/mkusers | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index e2c24c7..d834578 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -35,7 +35,7 @@ PASSWD="${TARGET_DIR}/etc/passwd"
 SHADOW="${TARGET_DIR}/etc/shadow"
 GROUP="${TARGET_DIR}/etc/group"
 # /etc/gshadow is not part of the standard skeleton, so not everybody
-# will have it, but some may hav it, and its content must be in sync
+# will have it, but some may have it, and its content must be in sync
 # with /etc/group, so any use of gshadow must be conditional.
 GSHADOW="${TARGET_DIR}/etc/gshadow"
 
@@ -43,7 +43,7 @@ GSHADOW="${TARGET_DIR}/etc/gshadow"
 # such as:
 #    BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
 # which when sourced from a shell script will eventually try to execute
-# a command name 'CONFIG_DIR', which is plain wrong for virtually every
+# a command named 'CONFIG_DIR', which is plain wrong for virtually every
 # systems out there.
 # So, we have to scan that file instead. Sigh... :-(
 PASSWD_METHOD="$( sed -r -e '/^BR2_TARGET_GENERIC_PASSWD_METHOD="(.*)"$/!d;'    \
-- 
1.9.1
