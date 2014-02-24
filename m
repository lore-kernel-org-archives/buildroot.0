From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 24 Feb 2014 10:25:40 +0100
Subject: [Buildroot] [PATCH v2 0/2] systemd/udev/eudev polishing
Message-ID: <1393233942-11638-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series contains enhancements for systemd, udev and eudev, intended
for next branch:

- use of proper virtual package infrastructure (suggested by Arnout).
- enable required kernel features for systemd (suggested by SamuelM).

Changes v1 -> v2:
 - reworked systemd help text (suggested by ThomasP).
 - removed shell commands in virtual package infra (suggested by ThomasP).

Best regards,
ELB

Eric Le Bihan (2):
  udev: update udev to new virtual package infra.
  systemd: enable required kernel features.

 linux/linux.mk            |    6 +++++-
 package/eudev/Config.in   |    3 +++
 package/systemd/Config.in |   19 +++++++++++++++++--
 package/udev/Config.in    |    8 ++++----
 package/udev/udev.mk      |   16 ++++------------
 5 files changed, 33 insertions(+), 19 deletions(-)

-- 
1.7.9.5
