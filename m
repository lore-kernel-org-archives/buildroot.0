From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 14 Apr 2012 23:53:03 +0200
Subject: [Buildroot] [git commit] samba: security bump to version 3.5.14
Message-ID: <20120414215737.DA66296A79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6e0f2fdf2665f67e2bc6400c8479d6fca7e2fe4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump samba to version 3.5.14 to fix CVE-2012-1182

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index c15efca..48810b9 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SAMBA_VERSION = 3.5.12
+SAMBA_VERSION = 3.5.14
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
