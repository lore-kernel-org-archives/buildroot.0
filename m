From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 18 Mar 2014 17:01:43 +0100
Subject: [Buildroot] [PATCH] libraries: add category Logging
Message-ID: <1395158503-17605-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add new category and move all logging packages there:

liblog4c-localtime
liblogging
log4cplus
log4cxx
zlog

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 688ed4d..8986734 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -666,6 +666,14 @@ source "package/xerces/Config.in"
 source "package/yajl/Config.in"
 endmenu
 
+menu "Logging"
+source "package/liblog4c-localtime/Config.in"
+source "package/liblogging/Config.in"
+source "package/log4cplus/Config.in"
+source "package/log4cxx/Config.in"
+source "package/zlog/Config.in"
+endmenu
+
 menu "Multimedia"
 source "package/libass/Config.in"
 source "package/libbluray/Config.in"
@@ -773,8 +781,6 @@ source "package/libevent/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
-source "package/liblog4c-localtime/Config.in"
-source "package/liblogging/Config.in"
 source "package/libnspr/Config.in"
 source "package/libpfm4/Config.in"
 source "package/libplist/Config.in"
@@ -788,8 +794,6 @@ source "package/libtpl/Config.in"
 source "package/libunwind/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
-source "package/log4cplus/Config.in"
-source "package/log4cxx/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/mpc/Config.in"
 source "package/mpfr/Config.in"
@@ -803,7 +807,6 @@ source "package/protobuf-c/Config.in"
 source "package/schifra/Config.in"
 source "package/startup-notification/Config.in"
 source "package/tzdata/Config.in"
-source "package/zlog/Config.in"
 endmenu
 
 menu "Security"
-- 
1.8.1.2
