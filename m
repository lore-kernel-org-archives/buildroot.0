From: Samuel Martin <s.martin49@gmail.com>
Date: Thu,  5 Jun 2014 01:04:09 +0200
Subject: [Buildroot] [PATCH v6 0/4] rpi-userland/xbmc fixes
Message-ID: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is just more fixes about rpi-userland/xbmc and all.

Yours,
Samuel

Samuel Martin (3):
  xbmc: fix missing libraries from rpi-userland
  rpi-userland: add patch fix missing libvcilcs install rules
  rpi-userland: cleanup *_CONF_OPT

Yann E. MORIN (1):
  package/libcec: fix missing libraries from rpi-userland

 package/libcec/libcec.mk                           |  1 +
 ...vmcs_host-add-install-rules-for-libvcilcs.patch | 23 ++++++++++++++++++++++
 package/rpi-userland/rpi-userland.mk               |  2 +-
 package/xbmc/xbmc.mk                               |  3 ++-
 4 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch

--
2.0.0
