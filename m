From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 23:44:24 +0200
Subject: [Buildroot] [git commit] texinfo: add license information
Message-ID: <20140708222427.E0C699D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4950a35a40f879cb207a2f3e1f62f099b21bbb17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/texinfo/texinfo.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
index 7064e12..afb3bca 100644
--- a/package/texinfo/texinfo.mk
+++ b/package/texinfo/texinfo.mk
@@ -10,5 +10,7 @@
 
 TEXINFO_VERSION = 4.13a
 TEXINFO_SITE = $(BR2_GNU_MIRROR)/texinfo
+TEXINFO_LICENSE = GPLv3+
+TEXINFO_LICENSE_FILES = COPYING
 
 $(eval $(host-autotools-package))
