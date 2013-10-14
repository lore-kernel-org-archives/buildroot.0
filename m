From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 22:54:53 +0200
Subject: [Buildroot] [git commit] netcat: add license information
Message-ID: <20131014210424.4943C9B9FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54e0493ad7399faae23757270be4db29efa063ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netcat/netcat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 5b083e6..5d01ebb 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -6,5 +6,7 @@
 
 NETCAT_VERSION = 0.7.1
 NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
+NETCAT_LICENSE = GPLv2+
+NETCAT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
