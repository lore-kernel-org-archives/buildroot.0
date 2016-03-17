From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 17 Mar 2016 18:27:02 +0300
Subject: [Buildroot] [PATCH 0/2] xtensa noMMU support
Message-ID: <1458228424-10330-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this series enables noMMU support for xtensa.
noMMU xtensa uses FLAT binaries and linuxthreads.
This series assumes elf2flt support for Xtensa.

Max Filippov (2):
  gcc: add xtensa uClinux support
  uclibc: enable linuxthreads for xtensa

 .../gcc/4.8.5/874-xtensa-add-uclinux-support.patch | 174 +++++++++++++++++++++
 .../gcc/4.9.3/874-xtensa-add-uclinux-support.patch | 174 +++++++++++++++++++++
 .../gcc/5.3.0/874-xtensa-add-uclinux-support.patch | 174 +++++++++++++++++++++
 package/uclibc/Config.in                           |   2 +-
 4 files changed, 523 insertions(+), 1 deletion(-)
 create mode 100644 package/gcc/4.8.5/874-xtensa-add-uclinux-support.patch
 create mode 100644 package/gcc/4.9.3/874-xtensa-add-uclinux-support.patch
 create mode 100644 package/gcc/5.3.0/874-xtensa-add-uclinux-support.patch

-- 
2.1.4
