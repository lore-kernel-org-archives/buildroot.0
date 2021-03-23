From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Tue, 23 Mar 2021 12:26:16 +0200
Subject: [Buildroot] Buildroot: enable lib/firmware/brcm for rpi0w
Message-ID: <CAPm8-H4Kq23eCBX0XeZReOdr7hHzQzPymzqZckDDfXCKV1Q_bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildroot community,

  Please tell me what option should be enabled
in buildroot 2020.11 in order to have for raspberry pi zero w:
output/target/lib/firmware/brcm/brcmfmac43430-sdio.bin
output/target/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi-rpi.txt
output/target/lib/firmware/brcm/brcmfmac43430-sdio.txt
  These are required by brcmfmac to have wifi working.
By default they are not installed, even if I do
make raspberrypi0w_defconfig

Thanks
L-C
