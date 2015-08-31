From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Mon, 31 Aug 2015 08:53:25 -0700
Subject: [Buildroot] First rootfile system build using buildroot
In-Reply-To: <CAKpDV8uLvtaLFK=Oxd5vw-zpkzB9C+m0_hhmx-9meZSRViW12g@mail.gmail.com>
References: <CAKpDV8uVJjtssJDEx4knqtATvjXzy+kdKtwBoWWLcv-9v4cikg@mail.gmail.com>
 <CAKpDV8uLvtaLFK=Oxd5vw-zpkzB9C+m0_hhmx-9meZSRViW12g@mail.gmail.com>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C344F7@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Katoch,

My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.05. I made the former meet the latter?s requirements. My target is Marvell ARMADA A385 (ARM-Cortex-A9) DB-88F6820-GP.

I have succeeded in the building of zImage. It is able to be booted up on the target, using U-Boot-1.73.

For this work I used the Buildroot internal toolchain; configured the rootfilesystem built into zImage and the device tree blob built outside zImage.

I hope my experience is useful for your work.

Tommy

________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150831/756a5f96/attachment.html>
