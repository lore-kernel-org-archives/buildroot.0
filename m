From: Michael Walle <michael@walle.cc>
Date: Tue, 12 Jan 2021 11:51:52 +0100
Subject: [Buildroot] [PATCH 0/2] Add support for an RCW on sl28 boards
Message-ID: <20210112105154.31531-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new package for the RCW and then use it on the sl28 board to
integrate it into the target image.

Michael Walle (2):
  package/rcw-smarc-sal28: new package
  configs/kontron_smarc_sal28: integrate RCW into rootfs image

 DEVELOPERS                                   |  1 +
 board/kontron/smarc-sal28/genimage.cfg       |  6 ++++
 configs/kontron_smarc_sal28_defconfig        |  1 +
 package/Config.in                            |  1 +
 package/rcw-smarc-sal28/Config.in            | 25 +++++++++++++
 package/rcw-smarc-sal28/rcw-smarc-sal28.hash |  3 ++
 package/rcw-smarc-sal28/rcw-smarc-sal28.mk   | 37 ++++++++++++++++++++
 7 files changed, 74 insertions(+)
 create mode 100644 package/rcw-smarc-sal28/Config.in
 create mode 100644 package/rcw-smarc-sal28/rcw-smarc-sal28.hash
 create mode 100644 package/rcw-smarc-sal28/rcw-smarc-sal28.mk

-- 
2.20.1
