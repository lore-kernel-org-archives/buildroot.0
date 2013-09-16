From: Jonas Ludvigsson <jonas.ludvigsson@connectBlue.com>
Date: Mon, 16 Sep 2013 12:07:35 +0000
Subject: [Buildroot] Problems with 'iw'
Message-ID: <BECCD53EFF877A4F8D909C37120A85375303DD68@CHEWBACCA.connectBlue.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to enable the wlan module on a TI AM335x EVM Board and have successfully been able to add drivers and firmware for wl1271.
But when I'm trying start a scan using 'iw' I get 'Segmentation fault'. In fact all 'iw' always returns segmentation fault.

I added support for 'iw' in Buildroot (2013.08) which is configured to use its internal toolchain (uClibc 0.9.33.x),
kernel version (3.2.42) and Busybox (1.21.x).

What could be the problem?

Regards,
Jonas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130916/044fa1fd/attachment.html>
