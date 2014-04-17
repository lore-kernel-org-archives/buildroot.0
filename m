From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 21:48:00 +0200
Subject: [Buildroot] [git commit] zeromq: bump to version 4.0.4
Message-ID: <20140417201755.A0EBD9C0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbcf2806b961534861c08c60036118064936ac26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zeromq/zeromq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index d40bed5..833c1d3 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.0.1
+ZEROMQ_VERSION = 4.0.4
 ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
