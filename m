From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:47:50 +0200
Subject: [Buildroot] [git commit] input-event-daemon: Add license info
Message-ID: <20120806104900.C072A96D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b7102b60d18233ecc9e752daec0710f311ce2dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license info for input-event-daemon.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/input-event-daemon/input-event-daemon.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 0683056..f99bfbe 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -6,6 +6,8 @@
 
 INPUT_EVENT_DAEMON_VERSION = v0.1.3
 INPUT_EVENT_DAEMON_SITE = git://github.com/gandro/input-event-daemon.git
+INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
+INPUT_EVENT_DAEMON_LICENSE_FILES = README
 
 define INPUT_EVENT_DAEMON_BUILD_CMDS
 	touch  $(@D)/input-event-table.h
