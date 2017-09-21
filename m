From: luke <skywal_l@hotmail.com>
Date: Thu, 21 Sep 2017 14:46:37 +0000
Subject: [Buildroot] Separate board config from the rest
Message-ID: <HE1PR03MB3049EA7D60AC0E819A4B992FE7660@HE1PR03MB3049.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

  My problem is I have different images which differs only by the board on which I install them (rpi0w, rpi2 or pi3) but the configuration of the toolchain, of the image, the installed packages, the overlays, etc, are the same. Each time I add a package, I need to add it to all the boards config I want to support.
  Is there a way to separate the board specific part of a config with the configuration of the toolchain and the package selection?

Thanks
