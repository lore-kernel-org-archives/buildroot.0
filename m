From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 27 Feb 2020 11:51:21 -0300
Subject: [Buildroot] [PATCH 0/2] package/eudev: support openrc init
Message-ID: <20200227145123.5654-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

- Add udev-gentoo-scripts, which contains the required scripts
- Select udev-gentoo-scripts and avoid installing the sysv init script
  when the init system is openrc.

Carlos Santos (2):
  udev-gentoo-scripts: new packages
  package/eudev: support openrc init

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/eudev/Config.in                       |  1 +
 package/eudev/eudev.mk                        |  4 ++++
 package/udev-gentoo-scripts/Config.in         |  6 +++++
 .../udev-gentoo-scripts.hash                  |  3 +++
 .../udev-gentoo-scripts.mk                    | 22 +++++++++++++++++++
 7 files changed, 38 insertions(+)
 create mode 100644 package/udev-gentoo-scripts/Config.in
 create mode 100644 package/udev-gentoo-scripts/udev-gentoo-scripts.hash
 create mode 100644 package/udev-gentoo-scripts/udev-gentoo-scripts.mk

-- 
2.18.2
