From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:07:50 +0200
Subject: [Buildroot] [git commit] gob2: bump to version 2.0.18
Message-ID: <20111015213658.8D3E08D520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a9d386ca96960d0c7d7db4268f3877688662e10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gob2/gob2.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 39aa554..c557288 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -3,13 +3,10 @@
 # gob2
 #
 #############################################################
-GOB2_VERSION = 2.0.15
-GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.gz
-GOB2_SITE = http://ftp.5z.com/pub/gob/
-IPERF_CONF_ENV = ac_cv_lib_lex=-lfl
 
+GOB2_VERSION = 2.0.18
+GOB2_SITE = http://ftp.5z.com/pub/gob
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config host-flex
-
 HOST_GOB2_DEPENDENCIES = host-libglib2
 
 $(eval $(call AUTOTARGETS))
