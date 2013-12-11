From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:21:53 +0100
Subject: [Buildroot] [git commit] libsexy: add licensing info
Message-ID: <20131211213614.A9DF79A383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=415d65e81aef6a8d128a230b9a890c63711cbf73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsexy/libsexy.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index 4f0f87c..3cfb536 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -8,5 +8,7 @@ LIBSEXY_VERSION = 0.1.11
 LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
 LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_STAGING = YES
+LIBSEXY_LICENSE = LGPLv2.1+
+LIBSEXY_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
