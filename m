From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 7 Dec 2016 11:48:15 -0800
Subject: [Buildroot] [PATCH 0/2] Update Xen and fix build issue
Message-ID: <1481140097-32096-1-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series updates Xen to 4.7.1 and fixes a build issue that previously existed.

NOTE: Xen 4.8.0 was released today, but that failed to compile so it will be more work.
At the moment Xen doesn't build so fix that first.

Alistair Francis (2):
  package/xen: Bump Xen to 4.7.1
  package/xen: Disable strict unused-const-variable checking

 ...-Disable-strtict-unused-const-variable-ch.patch | 27 ++++++++++++++++++++++
 package/xen/xen.hash                               |  2 +-
 package/xen/xen.mk                                 |  2 +-
 3 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 package/xen/0003-tools-libxl-Disable-strtict-unused-const-variable-ch.patch

-- 
2.7.4
