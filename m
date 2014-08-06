From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:53:01 +0200
Subject: [Buildroot] [git commit] busybox: enable ash getopts
Message-ID: <20140806175859.9AAE99D3C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9598aa9da2f5b8030b3d161c7a43438f2b32150c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's increasingly used by scripts like some in the btrfs-progs package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 7b6d9b7..05ef676 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -975,7 +975,7 @@ CONFIG_ASH_BASH_COMPAT=y
 CONFIG_ASH_IDLE_TIMEOUT=y
 CONFIG_ASH_JOB_CONTROL=y
 CONFIG_ASH_ALIAS=y
-# CONFIG_ASH_GETOPTS is not set
+CONFIG_ASH_GETOPTS=y
 CONFIG_ASH_BUILTIN_ECHO=y
 CONFIG_ASH_BUILTIN_PRINTF=y
 CONFIG_ASH_BUILTIN_TEST=y
