From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:51:07 +0200
Subject: [Buildroot] [git commit] makedevs: add license information
Message-ID: <20140715205147.A6C099D24C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21510bdb0bfee931d2ac4929663e8398278b8e2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: change license to be GPLv2. The header of makedevs.c is a bit
unclear, as it mentions both the GPL and LGPL. But since the code
seems to originally be coming from Busybox, assuming GPLv2 is the
safest option.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/makedevs/makedevs.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 7210dc6..fa8e753 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -9,6 +9,7 @@ MAKEDEVS_SOURCE =
 HOST_MAKEDEVS_SOURCE =
 
 MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
+MAKEDEVS_LICENSE = GPLv2
 
 define MAKEDEVS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
