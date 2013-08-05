From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Aug 2013 22:46:03 +0200
Subject: [Buildroot] [git commit] samba: security bump to version 3.6.17
Message-ID: <20130805204958.A23A59B194@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a785a55e3594f7e0cb265d681aa33dc53c9fe0ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-4124.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index fd90d96..71fba08 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA_VERSION = 3.6.16
+SAMBA_VERSION = 3.6.17
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
