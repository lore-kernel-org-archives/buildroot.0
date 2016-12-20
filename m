From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 09:32:06 +0100
Subject: [Buildroot] [git commit] mkusers: fix spelling in intro comment
Message-ID: <20161220091251.C26EF80AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ac9d83f55f9ec30bd67767fab3c8e09249ae372
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
