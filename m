From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 21:37:30 +0200
Subject: [Buildroot] [git commit] apr: bump to version 1.4.8
Message-ID: <20131014203036.42F899B9FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fd212c19d6e055650ce20748f504093262d0004
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr/apr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 6394882..4da42c5 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.4.6
+APR_VERSION = 1.4.8
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
 APR_LICENSE_FILES = LICENSE
