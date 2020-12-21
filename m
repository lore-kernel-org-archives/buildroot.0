From: Muhammad Masood <masoodmohammad54@gmail.com>
Date: Mon, 21 Dec 2020 10:16:36 +0100
Subject: [Buildroot] Beaglebone Black interface with LCD cape
Message-ID: <CAFheWCcOVFiNTshTp6SBDLUJbej1R-D_zPAJtsuQUUuywVHn6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hallo Buildroot Team,

I want to add a device tree overlay for the BeagleBone Black with an LCD
screen (4D Systems gen4-4DCAPE-43T).
I found this bug ( Bug 11656 ) but the below paste lines are not clear for
me.
"Therefore I created the attached device tree source code, which takes the
am335x-boneblack.dts as a basis (#include) and adds the definitions from <
https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE-4D4R-01-00A1.dts>
translated from "overlay fragment" syntax to normal dts code (reference: <
https://pastebin.com/b8kZfhRG>)."

My question is how to create this file am335x-withcapes-4d4r.dts?
Please can you explain to me the above text step by step?

Regards
Masood
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201221/5b7f3163/attachment.html>
