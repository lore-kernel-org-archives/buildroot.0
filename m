From: Will Newton <will.newton@gmail.com>
Date: Fri, 19 Oct 2012 17:27:35 +0100
Subject: [Buildroot] [PATCH 1/3] package/liburcu: Bump version to 0.7.5.
Message-ID: <CAFbHwiRP=LPt_yd3mYsZwGqMZfOU-ihB00qZP6VnNMKEix7N3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/liburcu/liburcu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index bd69137..0bfba37 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -3,7 +3,7 @@
 # liburc: userspace RCU (read-copy-update) library
 #
 #############################################################
-LIBURCU_VERSION = 0.7.3
+LIBURCU_VERSION = 0.7.5
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2

-- 
1.7.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-package-liburcu-Bump-version-to-0.7.5.patch
Type: application/octet-stream
Size: 830 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121019/7ce25e77/attachment.obj>
