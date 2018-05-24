From: Matthew Starr <mstarr@hedonline.com>
Date: Thu, 24 May 2018 17:04:32 +0000
Subject: [Buildroot] lrzsz package missing X and Y modem support binaries
Message-ID: <3C8219BAE02B894A9C69304A12E8AA06CA23E97B@HED-Exchange.hed.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Linux distributions the lrzsz package would install not only Zmodem (rz, sz) support binaries but also Xmodem (rx, sx) and Ymodem (rb, sb) support binaries too.

Why does buildroot's package not also include X and Y modem support binaries?  Is there a way to add this support?

Based on a quick glance of the source of lrzsz I could not spot where the X and Y modem binaries would come from like in the Linux distributions.

Best regards,
?
Matthew Starr
