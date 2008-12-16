From: Tim Barr <tbarr@multitech.com>
Date: Tue, 16 Dec 2008 16:01:31 -0600
Subject: [Buildroot] Questions on buildroot device_table.txt file and how to
	use it
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60F3544B0@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have been having a problem with missing devices in buildroot for my
at91sam9g20 design, specifically rtc0 and ppp. The kernel has ppp
enabled and sets the rtt to rtc0. But the RFS does not have drivers for
either in the /dev directory. Doing some research I found a file in
buildroot called device_table.txt that looks like what I need to modify
in order to make these drivers available in my build. One thing I am not
sure of is which version of this file I should modify. There is one in
"target/generic" and also in "target/device/Atmel/root". Which one
should I change? Also, it is not clear to me if it is possible to have
board specific device_table.txt files. Is that possible? And if so, how
would I do it? 
 


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081216/4703234c/attachment.htm 
