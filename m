From: gdbabu Krishnan <gdbabu.krishnan@gmail.com>
Date: Wed, 1 Jun 2016 12:19:14 +0530
Subject: [Buildroot] gpio chip not found
Message-ID: <CAG7w3y=HqgN8bEnyZXy1we0SRx6HgUsN=FRUoZE-uyKP=0ROtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


i am working with buildroot for raspberry pi i have successfully build and
got sdcard.img.

my problem is when i "modprobe lirc_rpi.ko" it shows following message

lirc_rpi:gpio chip not found

modprobe: can't load module lirc_rpi
(kernel/driver/staging/media/lirc/lir_rpi.ko): No such device

i also include "dtoverlay=lirc-rpi" in config.txt under boot directory.

kindly help me to resolve this problem,

thank you,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160601/688aab9b/attachment.html>
