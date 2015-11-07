From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Nov 2015 11:33:35 +0100
Subject: [Buildroot] [PATCH 0/3] New packages libglfw/cal3d/vsxu
Message-ID: <1446892418-6932-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

these package will be needed by the upcoming
kodi-visualisation-vsxu package, part of the Kodi 16.0-Jarvis bump:

https://github.com/notspiff/visualization.vsxu/blob/master/CMakeLists.txt#L8

Regards, Bernd

Bernd Kuhls (3):
  package/libglfw: new package
  package/cal3d: new package
  package/vsxu: new package

 package/Config.in                         |  3 +++
 package/cal3d/Config.in                   |  6 ++++++
 package/cal3d/cal3d.mk                    | 10 +++++++++
 package/libglfw/Config.in                 | 16 ++++++++++++++
 package/libglfw/libglfw.hash              |  2 ++
 package/libglfw/libglfw.mk                | 15 +++++++++++++
 package/vsxu/0001-disable-backtrace.patch | 35 +++++++++++++++++++++++++++++++
 package/vsxu/Config.in                    | 20 ++++++++++++++++++
 package/vsxu/vsxu.mk                      | 31 +++++++++++++++++++++++++++
 9 files changed, 138 insertions(+)
 create mode 100644 package/cal3d/Config.in
 create mode 100644 package/cal3d/cal3d.mk
 create mode 100644 package/libglfw/Config.in
 create mode 100644 package/libglfw/libglfw.hash
 create mode 100644 package/libglfw/libglfw.mk
 create mode 100644 package/vsxu/0001-disable-backtrace.patch
 create mode 100644 package/vsxu/Config.in
 create mode 100644 package/vsxu/vsxu.mk

-- 
2.6.2
