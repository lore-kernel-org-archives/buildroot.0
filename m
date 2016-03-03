From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 3 Mar 2016 10:49:24 +0100
Subject: [Buildroot] usb_modeswitch issues
Message-ID: <CAGm1_ktE6wRSd=g7DAtwN_S5+6kg64px0J62Sh3vPKiHxSngxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo, all,

I experience strange Segmentation faults with usb_modeswitch 2.3.0
(didn't really used if earlier, so I know nothing about earlier
versions):

http://www.draisberghof.de/usb_modeswitch/bb/viewtopic.php?f=4&t=2489&p=16378#p16378

Do you understand, what LOM means saying:

"You have forgotten to build the wrapper (usb_modeswitch.tcl) "

I've looked at usb_modeswitch Makefile and I cannot see
usb_modeswitch.tcl in install target.

Yegor
