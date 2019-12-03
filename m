From: Jan Kotas <jank@cadence.com>
Date: Tue, 3 Dec 2019 04:18:12 -0500
Subject: [Buildroot] [PATCH v2 0/3] boot/boot-wrapper-aarch64: bump and
 upgrade
Message-ID: <20191203091815.22668-1-jank@cadence.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series bumps the boot wrapper for aarch64 to the latest
version. It also adds an option to use GICv3 (such as GIC-500).
Handling of the DTB has been also improved.

Jan Kotas (3):
  boot/boot-wrapper-aarch64: bump version
  boot/boot-wrapper-aarch64: improve dtb handling
  boot/boot-wrapper-aarch64: add gicv3 support

 boot/boot-wrapper-aarch64/Config.in            |  5 +++++
 .../boot-wrapper-aarch64.mk                    | 18 +++++++-----------
 2 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.18.0
