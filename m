From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:53 -0000
Subject: [Buildroot] [git commit branch/next] pcre: define license
Message-ID: <20120802195252.61B8C8D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41633ecc24aee2e1938be80945015d4f9ae98803
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcre/pcre.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index db896fd..d01ca84 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -6,6 +6,8 @@
 
 PCRE_VERSION = 8.30
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
+PCRE_LICENSE = BSD-3c
+PCRE_LICENSE_FILES = LICENCE
 PCRE_INSTALL_STAGING = YES
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
