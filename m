From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 13:31:37 +0100
Subject: [Buildroot] [PATCH 0/2] bluez5_utils: update and fix
Message-ID: <1419856299-30204-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of two patches bump bluez5_utils to the latest upstream
version, and fixes a build issue reported by the autobuilders.

Thomas

Thomas Petazzoni (2):
  bluez5_utils: bump to version 5.27
  bluez5_utils: fix missing link against librt

 .../bluez5_utils/0001-Link-mcaptest-with-lrt.patch | 37 ++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.hash             |  2 +-
 package/bluez5_utils/bluez5_utils.mk               |  5 ++-
 3 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 package/bluez5_utils/0001-Link-mcaptest-with-lrt.patch

-- 
2.1.0
