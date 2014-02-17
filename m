From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 17 Feb 2014 11:22:14 +0100
Subject: [Buildroot] [PATCH 0/2] systemd/udev/eudev polishing
Message-ID: <1392632536-16714-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series contains enhancements for systemd, udev and eudev, intended
for next branch:

- use of proper virtual package infrastructure (suggested by Arnout).
- enable required kernel features for systemd (suggested by SamuelM).

Best regards,
ELB

Eric Le Bihan (2):
  udev: update udev to new virtual package infra.
  systemd: enable required kernel features.

 linux/linux.mk            |    6 +++++-
 package/eudev/Config.in   |    3 +++
 package/systemd/Config.in |   15 +++++++++++++--
 package/udev/Config.in    |    8 ++++----
 package/udev/udev.mk      |   11 ++---------
 5 files changed, 27 insertions(+), 16 deletions(-)

-- 
1.7.9.5
