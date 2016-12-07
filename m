From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 7 Dec 2016 15:38:38 -0800
Subject: [Buildroot] [PATCH v2 0/2] Update Xen and fix build issue
Message-ID: <1481153920-20627-1-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series updates Xen to 4.7.1 and fixes a build issue that previously existed.

NOTE: Xen 4.8.0 was released today, but that failed to compile so it will be more work.
At the moment Xen doesn't build so fix that first.

V2:
 - Fix typo and add commit message to patch 2

Alistair Francis (2):
  package/xen: Bump Xen to 4.7.1
  package/xen: Disable strict unused-const-variable checking

 ...-Disable-strict-unused-const-variable-che.patch | 27 ++++++++++++++++++++++
 package/xen/xen.hash                               |  2 +-
 package/xen/xen.mk                                 |  2 +-
 3 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 package/xen/0003-tools-libxl-Disable-strict-unused-const-variable-che.patch

-- 
2.7.4
