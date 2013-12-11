From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:24:28 +0100
Subject: [Buildroot] [git commit] libdvdread: add licensing info
Message-ID: <20131211213615.112F29A383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a5439464c731c835e03eb84d768cdd979495f1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdvdread/libdvdread.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index f7c59af..35d7548 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -11,5 +11,7 @@ LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_CONFIG_SCRIPTS = dvdread-config
+LIBDVDREAD_LICENSE = GPLv2+
+LIBDVDREAD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
