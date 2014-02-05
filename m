From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2014 13:41:18 +0100
Subject: [Buildroot] [git commit] gpm: needs bison
Message-ID: <20140205124146.216F39C808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85e904ba437ab0cec47849b392b57abd7a4265a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/a4b/a4b473ae0a97fe79dbc30e6603f029f946c011fe/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpm/gpm.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 58fab00..85fdad6 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -10,6 +10,7 @@ GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives/
 GPM_LICENSE = GPLv2+
 GPM_LICENSE_FILES = COPYING
 GPM_INSTALL_STAGING = YES
+GPM_DEPENDENCIES = host-bison
 
 # if not already installed in staging dir, gpm Makefile may fail to find some
 # of the headers needed to generate build dependencies, the first time it is
