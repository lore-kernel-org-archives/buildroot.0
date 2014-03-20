From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Mar 2014 16:43:47 +0100
Subject: [Buildroot] [git commit] libraries: add category Logging
Message-ID: <20140320155006.1F30B9C1E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cda5715a44b3232a62a58af0c7e31943cbea7f6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new category and move all logging packages there:

liblog4c-localtime
liblogging
log4cplus
log4cxx
zlog

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

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
