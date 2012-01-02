From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 17:02:21 +0100
Subject: [Buildroot] [git commit] samba: security bump to version 3.5.12
Message-ID: <20120102160226.9B5418FFBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f026f825cecc5bf106e433c0307f07fed2ae842b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/samba.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index de2c13b..4e02682 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -3,9 +3,9 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION = 3.5.11
-SAMBA_SOURCE = samba-$(SAMBA_VERSION).tar.gz
-SAMBA_SITE = http://ftp.samba.org/pub/samba/stable/
+
+SAMBA_VERSION = 3.5.12
+SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 
 SAMBA_SUBDIR = source3
 SAMBA_AUTORECONF = NO
