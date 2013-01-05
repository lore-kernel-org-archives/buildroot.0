From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  5 Jan 2013 15:10:51 +0100
Subject: [Buildroot] [pull request] Pull request for branch rpi-support
Message-ID: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

A short series to add some needed RaspberryPi specific packages in order to
build a rootfs for this board.

The following changes since commit 66bfe1d4fe2de50aef6ac3fc836a710fa577cdef:

  xdriver_xf86-video-sunffb: remove package (2013-01-05 14:34:48 +0100)

are available in the git repository at:

  http://github.com/maximeh/buildroot.git rpi-support

for you to fetch changes up to 0a82214a34f519691ff795260820907a7a8b4cfc:

  rpi-fw: New package (2013-01-05 14:59:15 +0100)

----------------------------------------------------------------
Maxime Hadjinlian (3):
      libcofi: new package
      rpi-userland: new package
      rpi-fw: New package

 package/Config.in                    |    3 +++
 package/libcofi/Config.in            |    8 ++++++++
 package/libcofi/libcofi.mk           |   17 +++++++++++++++++
 package/rpi-fw/Config.in             |    9 +++++++++
 package/rpi-fw/cmdline.txt           |    1 +
 package/rpi-fw/config.txt            |    7 +++++++
 package/rpi-fw/rpi-fw.mk             |   22 ++++++++++++++++++++++
 package/rpi-userland/Config.in       |   12 ++++++++++++
 package/rpi-userland/rpi-userland.mk |   25 +++++++++++++++++++++++++
 9 files changed, 104 insertions(+)
 create mode 100644 package/libcofi/Config.in
 create mode 100644 package/libcofi/libcofi.mk
 create mode 100644 package/rpi-fw/Config.in
 create mode 100644 package/rpi-fw/cmdline.txt
 create mode 100644 package/rpi-fw/config.txt
 create mode 100644 package/rpi-fw/rpi-fw.mk
 create mode 100644 package/rpi-userland/Config.in
 create mode 100644 package/rpi-userland/rpi-userland.mk

Regards,
Maxime Hadjinlian

--
