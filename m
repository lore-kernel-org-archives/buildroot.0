From: Johnny Beardsmore <jny0@hotmail.com>
Date: Thu, 13 Jan 2011 09:55:41 +0000
Subject: [Buildroot] Inappropriate ioctl - hwclock
Message-ID: <SNT119-W1972A4A3A479929AD85F7882F00@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
 
I've copied the hwclock and rtc files onto my architecture, but when I call hwclock, I get the following message:
 
RTC_RD_TIME: Inappropriate ioctl for device
ioctl() to /dev/misc/rtc to read the time failed.
 
Any ideas what I've done wrong? 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110113/1943e36c/attachment.html>
