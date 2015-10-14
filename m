From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Wed, 14 Oct 2015 16:03:36 +0200
Subject: [Buildroot] Repair boot from SD card on i.MX6 Sabre boards
Message-ID: <1444831418-13483-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here is a two-patches series, to repair the boot from SD card on
Freescale Sabre boards.

The first patch adapts the SD card creation script to the new versions
of sfdisk; a prerequisite to actually preparing an SD card and booting
from it.

The second patch switches the defconfigs to building a zImage instead of
an uImage, to reflect what u-boot in Freescale releases awaits nowadays.

This was build-tested for all the five touched defconfigs but I did only
verify the boot on i.MX6 quad Sabre AI.

Feedbacks and testers welcome!

Best regards,

V.
