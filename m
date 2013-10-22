From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 16:09:34 +0200
Subject: [Buildroot] [git commit] nuttcp: add license information
Message-ID: <20131022142610.46A3B9BAEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=550fe0dcf63898a64494f4d1b2f137fe4432460c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nuttcp/nuttcp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 406219d..8a99ce3 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -7,6 +7,8 @@
 NUTTCP_VERSION = 6.1.2
 NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp/
 NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
+NUTTCP_LICENSE = GPLv2
+NUTTCP_LICENSE_FILES = LICENSE
 
 define NUTTCP_BUILD_CMDS
 	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
