From: David PICARD <davepiq@yahoo.fr>
Date: Sat, 24 Oct 2015 09:34:07 +0000 (UTC)
Subject: [Buildroot] Integrating ft6x06 touchscreen driver
References: <1587830330.3506598.1445679247577.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <1587830330.3506598.1445679247577.JavaMail.yahoo@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I could successfully build a system for the RPi B+ and Adafruit's PiTFT 2.8" capacitive touchscreen. The frame buffer works, and I can see my test Qt5 app on the TFT. Happy week for a noob !

So far, so good. But I'm stuck at the touchscreen part. I saw a driver (ft6x06) in Adafruit's git tree, but I don't really know how to use it. So, I'd be pleased if you could give me some guidelines.
Alternatively, I could use a USB mouse. But I although I could see an entry in /dev/input, the pointer would not show up on the TFT device.
Thanks,David.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151024/d17cd602/attachment.html>
