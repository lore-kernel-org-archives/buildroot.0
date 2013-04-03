From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Apr 2013 22:41:55 +0200
Subject: [Buildroot] [git commit] gob2: host variant needs host-bison and
	host-flex
Message-ID: <20130403204841.1822C9B468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aae616e5550e0a466a956bbf5b8d8e8d1016c6b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/837ab8dc79f732c2cdf52b9ac6c53d64e841b35f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gob2/gob2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index da208ac..c52f26c 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -7,7 +7,7 @@
 GOB2_VERSION = 2.0.18
 GOB2_SITE = http://ftp.5z.com/pub/gob
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkgconf host-flex
-HOST_GOB2_DEPENDENCIES = host-libglib2
+HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
