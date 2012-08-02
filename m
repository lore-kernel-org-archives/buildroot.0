From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:47 -0000
Subject: [Buildroot] [git commit branch/next] samba: bump to version 3.6.6
Message-ID: <20120802195245.B239396EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=335ffd1c64281b939314d5fe707408eacca02c02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump samba to version 3.6.6
Lots of bugfixes.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index d7a15b3..c968435 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SAMBA_VERSION = 3.6.5
+SAMBA_VERSION = 3.6.6
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
