From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu,  9 May 2013 10:30:27 -0700
Subject: [Buildroot] [PATCH] socketcand: add license information
Message-ID: <1368120627-26385-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/socketcand/socketcand.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index efade31..0826579 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -7,5 +7,6 @@ SOCKETCAND_VERSION = 7d06986
 SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/master
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_DEPENDENCIES = libconfig
+SOCKETCAND_LICENSE = GPLv2
 
 $(eval $(autotools-package))
-- 
1.7.4.1
