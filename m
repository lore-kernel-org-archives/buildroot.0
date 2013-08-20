From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Aug 2013 13:02:59 +0200
Subject: [Buildroot] [PATCH 0/5] Set of fixes, for 2013.08
Message-ID: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a small set of fixes, intended for 2013.08. Please review and
provide Acked-by if appropriate, so that I can apply them afterwards.

Thanks!

Thomas

Thomas Petazzoni (5):
  attr: add patch to fix static installation
  acl: add patch to fix static installation
  Makefile: test before search for kernel modules
  Makefile: do not try to strip inexisting file when stripping
    libpthread
  kmod: does not support static builds

 Makefile                                           |  7 +++---
 .../acl/acl-01-support-static-installation.patch   | 29 ++++++++++++++++++++++
 .../attr/attr-01-support-static-installation.patch | 29 ++++++++++++++++++++++
 package/kmod/Config.in                             |  1 +
 package/udev/Config.in                             |  1 +
 system/Config.in                                   |  1 +
 6 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100644 package/acl/acl-01-support-static-installation.patch
 create mode 100644 package/attr/attr-01-support-static-installation.patch

-- 
1.8.1.2
