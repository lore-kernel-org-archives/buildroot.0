From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 23:57:07 +0200
Subject: [Buildroot] [git commit] Update webkit download URL
Message-ID: <20130506221623.285E499C79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=498ddd195a42978f25855f09525012c26101b711
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael J. Hammel <mjhammel@graphics-muse.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/webkit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index d37601f..264bcad 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 WEBKIT_VERSION = 1.2.7
-WEBKIT_SITE = http://www.webkitgtk.org
+WEBKIT_SITE = http://www.webkitgtk.org/releases
 WEBKIT_INSTALL_STAGING = YES
 WEBKIT_DEPENDENCIES = host-flex host-bison host-gperf icu libcurl libxml2 \
 	libxslt libgtk2 sqlite enchant libsoup jpeg libgail
