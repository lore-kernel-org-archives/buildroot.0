From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 10:46:30 +0200
Subject: [Buildroot] [git commit] squeezelite: fix license typo
Message-ID: <20151014084634.C01BB7F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c40167b2040442873fc509c17281d7edcecc39c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squeezelite/squeezelite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index b9dfa7f..7a82f4a 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -7,7 +7,7 @@
 SQUEEZELITE_VERSION = v1.8
 SQUEEZELITE_SITE = $(call github,robadenshi,squeezelite,$(SQUEEZELITE_VERSION))
 SQUEEZELITE_LICENSE = GPLv3
-SQUEEZELITE_LICENSE_FILE = LICENSE.txt
+SQUEEZELITE_LICENSE_FILES = LICENSE.txt
 SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123
 SQUEEZELITE_MAKE_OPTS = -DLINKALL
 
