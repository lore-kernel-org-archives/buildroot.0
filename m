From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Sep 2014 10:02:59 +0200
Subject: [Buildroot] [git commit] texinfo: needs ncurses
Message-ID: <20140910080353.1F17C9D658@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1898e5b20afe4f2fe7cb562b8e6e692527cdce53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/be4/be4e19d55b24c00b8b0fd12c9e5d1e9c5d8b0cb3/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/texinfo/texinfo.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
index afb3bca..184288b 100644
--- a/package/texinfo/texinfo.mk
+++ b/package/texinfo/texinfo.mk
@@ -12,5 +12,6 @@ TEXINFO_VERSION = 4.13a
 TEXINFO_SITE = $(BR2_GNU_MIRROR)/texinfo
 TEXINFO_LICENSE = GPLv3+
 TEXINFO_LICENSE_FILES = COPYING
+TEXINFO_DEPENDENCIES = ncurses
 
 $(eval $(host-autotools-package))
