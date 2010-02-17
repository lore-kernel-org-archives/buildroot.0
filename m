From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 17 Feb 2010 01:05:09 +0100
Subject: [Buildroot] udev hidden by busybox
Message-ID: <EFAB42F6B6E0488D9548C40B17BA6052@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
While testing the 2010-rc1  i discovered  that udev was not build.
 
It seems to be hidden by BR2_BUSYBOX_SHOW_OTHERS
 
busybox provides mdev, but i tried it before and i had problems with it so i
went back to udev.
 
Personally i would not hide udev when BR2_BUSYBOX_SHOW_OTHERS is not set.
 
Johan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100217/4b441be3/attachment.htm>
