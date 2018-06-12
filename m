From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 12 Jun 2018 17:06:33 +0200
Subject: [Buildroot] [PATCH 0/2] imx-usb-loader: add i.MX8M support
Message-ID: <20180612150635.32032-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series bumps the version of imx-usb-loader so that it can be used
on latest i.MX8MQ processors from NXP.

Let me know if you have any question.

Regards,
Gary

Gary Bisson (2):
  imx-usb-loader: bump revision to e539461
  imx-usb-loader: enable package for 64-bit ARM platforms

 package/imx-usb-loader/Config.in.host      | 4 ++--
 package/imx-usb-loader/imx-usb-loader.hash | 2 +-
 package/imx-usb-loader/imx-usb-loader.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1
