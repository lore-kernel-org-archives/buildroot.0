From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:40:59 +0100
Subject: [Buildroot] [git commit] qextserialport: fix line endings in patch
	0002
Message-ID: <20161125214131.8C49E80DB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72dcc7c252e7be65ff3e66bcf5dd20b49e2de915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/074d379e4d491dd454726bed666a7e1028333ef7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Create-a-main-include-file-QExtSerialPort.patch | 23 ++++++++++------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch b/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch
index 1f14304..e1d99f0 100644
--- a/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch
+++ b/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch
@@ -28,16 +28,13 @@ diff --git a/src/qextserialport.pri b/src/qextserialport.pri
 index 461d56f..f8a678d 100644
 --- a/src/qextserialport.pri
 +++ b/src/qextserialport.pri
-@@ -3,7 +3,8 @@ DEPENDPATH += $$PWD
- 
- PUBLIC_HEADERS         += $$PWD/qextserialport.h \
-                           $$PWD/qextserialenumerator.h \
--                          $$PWD/qextserialport_global.h
-+                          $$PWD/qextserialport_global.h \
-+                          $$PWD/QExtSerialPort
- 
- HEADERS                += $$PUBLIC_HEADERS \
-                           $$PWD/qextserialport_p.h \
--- 
-2.10.2
-
+@@ -3,7 +3,8 @@
+ 
+ PUBLIC_HEADERS         += $$PWD/qextserialport.h \
+                           $$PWD/qextserialenumerator.h \
+-                          $$PWD/qextserialport_global.h
++                          $$PWD/qextserialport_global.h \
++			  $$PWD/QExtSerialPort
+ 
+ HEADERS                += $$PUBLIC_HEADERS \
+                           $$PWD/qextserialport_p.h \
