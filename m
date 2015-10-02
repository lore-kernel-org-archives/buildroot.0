From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Fri,  2 Oct 2015 11:37:19 -0300
Subject: [Buildroot] [PATCH 0/2] Add support for AXFS filesystem type
Message-ID: <1443796641-16056-1-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch series adds support for using the AXFS filesystem type.
The Advanced XIP File System is a Linux kernel filesystem driver that enables
files to be executed directly from flash or ROM memory rather than being copied
into RAM.

Thanks!
Ariel

Ariel D'Alessandro (2):
  axfsutils: add new package
  axfs: add new filesystem type

 fs/Config.in                   |  1 +
 fs/axfs/Config.in              |  4 ++++
 fs/axfs/axfs.mk                | 13 +++++++++++++
 package/axfsutils/axfsutils.mk | 21 +++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 fs/axfs/Config.in
 create mode 100644 fs/axfs/axfs.mk
 create mode 100644 package/axfsutils/axfsutils.mk

-- 
1.9.1
