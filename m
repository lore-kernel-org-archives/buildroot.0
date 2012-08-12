From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 18:32:17 +0200
Subject: [Buildroot] [git commit branch/next] samba: bump to version 3.6.7
Message-ID: <20120812163240.D2EC39716D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03e3cd9572665c8332c2ace0cbc8b251983108ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 6b9a082..301a39f 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SAMBA_VERSION = 3.6.6
+SAMBA_VERSION = 3.6.7
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
